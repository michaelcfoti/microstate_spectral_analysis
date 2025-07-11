# Microstate spectral analysis

This repository computes the spectral power of **Global Field Power (GFP)** associated with microstate sequences using **Lomb-Scargle periodograms**. It includes three analysis conditions to examine how spectral properties depend on the temporal structure of the data:

**1. Unshuffled**  
Original GFP and microstate label sequences

**2. Label-shuffled**  
Microstate labels are shuffled while the GFP sequence remains unchanged

**3. GFP-shuffled**  
GFP values are shuffled within each microstate, while the label sequence remains unchanged

---

### Provided `.mat` file contains:

- GFP data: `Nepochs × Nsamples`  
- Corresponding microstate label sequences

---

### Input Parameters

The analysis requires the following:

- **Number of microstates**  
- **Sampling frequency** (Hz)  
- **Maximum frequency** for spectral analysis (Hz)


## Shuffling Conditions

![Shuffling Conditions](img/shuffling_conditions.png)
