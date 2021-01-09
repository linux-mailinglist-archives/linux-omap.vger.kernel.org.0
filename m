Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CE42F0090
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 15:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbhAIOrk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Jan 2021 09:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbhAIOrj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Jan 2021 09:47:39 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BE1C061786
        for <linux-omap@vger.kernel.org>; Sat,  9 Jan 2021 06:46:57 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id p187so12887644iod.4
        for <linux-omap@vger.kernel.org>; Sat, 09 Jan 2021 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mwPtia1nD/Qpi9Bhr6bRR8QuA62wP4vgG/hVzJ3pFmA=;
        b=uBiUqvU8J9xzpgep/X3CoDRPTgE0pFrwnp+uaOTO4wCCY7l9dSZOcuh/LdMzW1fxKw
         7IBNgYutoVh46b3m8UPTNxCBsGyoWYXJtA/9y/6NHqJHzBsR3RHk1KYtFfsBcSC40ORL
         u2vN+sMT2rQJfTMPMqKfxkUXyRdhJg9OkRdbOi/ucOL5zXSj8brcvscEt37aLXlKU0dn
         Iii9jk4uePMpbZo4IIy02yXMSjP4HE9DREMX04iz/Ja547L9rJ06qA9yDQ4YsxKJiTzd
         yVGNoYlgQg+CFp/21mrU/buhiJ6AN+c4dM8q4wciCIackodM8sZDvXWAX4tacD1dPexI
         4trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mwPtia1nD/Qpi9Bhr6bRR8QuA62wP4vgG/hVzJ3pFmA=;
        b=MGE6nF0xQcBN7WwqcStEg1PJ5UxU90EV9gGeYI7JH161kJzuxenKidNkH5b2t+pFEi
         2/1f8rnQt0AyrsW8fkBpMa+LhLI+Ly0gj6myA9DvVsqv3S4wfwkhaXPXFaNGCs8eaEGh
         Zvydy2ncDr8iKKlhaMVcLfjvPSJ1l+CMHRaTpQwr3zGPSlv2TfIL1mEk8+t97ScHsnv4
         QmuMpbwia1FsDoFekTQ5B77JpciOZ/urdaKZaO3hlgnldl8GIPE/jTNFp9zopkurTeMs
         l2yIuRj/+5zgIIfCtvcTuHZm9ln+v0RaE2aqewU+TDq+X8UQaZocCWJmrTeaXV7NDOXW
         slTg==
X-Gm-Message-State: AOAM530dNswI+8w30XXcy7UypfKLAQ548DiNHFvYyEgHcEBF+MddRg3E
        3M5FDFRN5UnSLlv0+br758+6EYtfvE7iRJ8Hjfw=
X-Google-Smtp-Source: ABdhPJw0g3TN/vU0/kwfdtouZEqWFoCNTerwP3mHFo+G6c+F6KD2tsNGVTssvEO4VxDsE5HCDsm4Wh5AzLR3AoW94V8=
X-Received: by 2002:a6b:db01:: with SMTP id t1mr9349370ioc.10.1610203616062;
 Sat, 09 Jan 2021 06:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com> <20200929230124.31491-5-miquel.raynal@bootlin.com>
In-Reply-To: <20200929230124.31491-5-miquel.raynal@bootlin.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 9 Jan 2021 08:46:44 -0600
Message-ID: <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private structure
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
        ycllin@mxic.com.tw,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 29, 2020 at 6:09 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> The NAND BCH control structure has nothing to do outside of this
> driver, all users of the nand_bch_init/free() functions just save it
> to chip->ecc.priv so do it in this driver directly and return a
> regular error code instead.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Starting with this commit:  3c0fe36abebe, the kernel either doesn't
build or returns errors on some omap2plus devices with the following
error:

    nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
    nand: Micron MT29F4G16ABBDA3W
    nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
    nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
    Invalid ECC layout
    omap2-nand 30000000.nand: unable to use BCH library
    omap2-nand: probe of 30000000.nand failed with error -22
    8<--- cut here ---

There are few commits using git bisect that have build errors, so it
wasn't possible for me to determine the exact commit that broke the
ECC.  If the build failed, I marked it as 'bad' to git bisect.

Newer commits have remedied the build issue, but the Invalid ECC
layout error still exists as of 5.11-RC2.

Do you have any suggestions on what I can do to remedy this?  I am
willing to try and test.



>  drivers/mtd/nand/ecc-sw-bch.c       | 36 ++++++++++++++++-------------
>  drivers/mtd/nand/raw/fsmc_nand.c    |  2 +-
>  drivers/mtd/nand/raw/nand_base.c    | 12 ++++++----
>  drivers/mtd/nand/raw/omap2.c        | 16 ++++++-------
>  include/linux/mtd/nand-ecc-sw-bch.h | 11 ++++-----
>  5 files changed, 41 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
> index fe080a0837d8..97221ec3876e 100644
> --- a/drivers/mtd/nand/ecc-sw-bch.c
> +++ b/drivers/mtd/nand/ecc-sw-bch.c
> @@ -90,7 +90,7 @@ EXPORT_SYMBOL(nand_bch_correct_data);
>
>  /**
>   * nand_bch_init - Initialize software BCH ECC engine
> - * @mtd: MTD device
> + * @chip: NAND chip object
>   *
>   * Returns: a pointer to a new NAND BCH control structure, or NULL upon failure
>   *
> @@ -105,24 +105,24 @@ EXPORT_SYMBOL(nand_bch_correct_data);
>   * @eccsize = 512 (thus, m = 13 is the smallest integer such that 2^m - 1 > 512 * 8)
>   * @eccbytes = 7 (7 bytes are required to store m * t = 13 * 4 = 52 bits)
>   */
> -struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
> +int nand_bch_init(struct nand_chip *chip)
>  {
> -       struct nand_chip *nand = mtd_to_nand(mtd);
> +       struct mtd_info *mtd = nand_to_mtd(chip);
>         unsigned int m, t, eccsteps, i;
>         struct nand_bch_control *nbc = NULL;
>         unsigned char *erased_page;
> -       unsigned int eccsize = nand->ecc.size;
> -       unsigned int eccbytes = nand->ecc.bytes;
> -       unsigned int eccstrength = nand->ecc.strength;
> +       unsigned int eccsize = chip->ecc.size;
> +       unsigned int eccbytes = chip->ecc.bytes;
> +       unsigned int eccstrength = chip->ecc.strength;
>
>         if (!eccbytes && eccstrength) {
>                 eccbytes = DIV_ROUND_UP(eccstrength * fls(8 * eccsize), 8);
> -               nand->ecc.bytes = eccbytes;
> +               chip->ecc.bytes = eccbytes;
>         }
>
>         if (!eccsize || !eccbytes) {
>                 pr_warn("ecc parameters not supplied\n");
> -               goto fail;
> +               return -EINVAL;
>         }
>
>         m = fls(1+8*eccsize);
> @@ -130,7 +130,9 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
>
>         nbc = kzalloc(sizeof(*nbc), GFP_KERNEL);
>         if (!nbc)
> -               goto fail;
> +               return -ENOMEM;
> +
> +       chip->ecc.priv = nbc;
>
>         nbc->bch = bch_init(m, t, 0, false);
>         if (!nbc->bch)
> @@ -165,8 +167,8 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
>          * FIXME: we should probably rework the sequencing in nand_scan_tail()
>          * to avoid setting those fields twice.
>          */
> -       nand->ecc.steps = eccsteps;
> -       nand->ecc.total = eccsteps * eccbytes;
> +       chip->ecc.steps = eccsteps;
> +       chip->ecc.total = eccsteps * eccbytes;
>         if (mtd_ooblayout_count_eccbytes(mtd) != (eccsteps*eccbytes)) {
>                 pr_warn("invalid ecc layout\n");
>                 goto fail;
> @@ -192,12 +194,12 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
>                 nbc->eccmask[i] ^= 0xff;
>
>         if (!eccstrength)
> -               nand->ecc.strength = (eccbytes * 8) / fls(8 * eccsize);
> +               chip->ecc.strength = (eccbytes * 8) / fls(8 * eccsize);
>
> -       return nbc;
> +       return 0;
>  fail:
> -       nand_bch_free(nbc);
> -       return NULL;
> +       nand_bch_free(chip);
> +       return -EINVAL;
>  }
>  EXPORT_SYMBOL(nand_bch_init);
>
> @@ -205,8 +207,10 @@ EXPORT_SYMBOL(nand_bch_init);
>   * nand_bch_free - Release NAND BCH ECC resources
>   * @nbc: NAND BCH control structure
>   */
> -void nand_bch_free(struct nand_bch_control *nbc)
> +void nand_bch_free(struct nand_chip *chip)
>  {
> +       struct nand_bch_control *nbc = chip->ecc.priv;
> +
>         if (nbc) {
>                 bch_free(nbc->bch);
>                 kfree(nbc->errloc);
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
> index 4191831df182..1bc2462efeab 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -927,7 +927,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
>
>         /*
>          * Don't set layout for BCH4 SW ECC. This will be
> -        * generated later in nand_bch_init() later.
> +        * generated later during BCH initialization.
>          */
>         if (nand->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
>                 switch (mtd->oobsize) {
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 189d3a301a38..c47441ddc5cf 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5208,6 +5208,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
>         struct mtd_info *mtd = nand_to_mtd(chip);
>         struct nand_device *nanddev = mtd_to_nanddev(mtd);
>         struct nand_ecc_ctrl *ecc = &chip->ecc;
> +       int ret;
>
>         if (WARN_ON(ecc->engine_type != NAND_ECC_ENGINE_TYPE_SOFT))
>                 return -EINVAL;
> @@ -5294,13 +5295,14 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
>                         ecc->strength = bytes * 8 / fls(8 * ecc->size);
>                 }
>
> -               /* See nand_bch_init() for details. */
> +               /* See the software BCH ECC initialization for details */
>                 ecc->bytes = 0;
> -               ecc->priv = nand_bch_init(mtd);
> -               if (!ecc->priv) {
> +               ret = nand_bch_init(chip);
> +               if (ret) {
>                         WARN(1, "BCH ECC initialization failed!\n");
> -                       return -EINVAL;
> +                       return ret;
>                 }
> +
>                 return 0;
>         default:
>                 WARN(1, "Unsupported ECC algorithm!\n");
> @@ -5960,7 +5962,7 @@ void nand_cleanup(struct nand_chip *chip)
>  {
>         if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
>             chip->ecc.algo == NAND_ECC_ALGO_BCH)
> -               nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
> +               nand_bch_free(chip);
>
>         nanddev_cleanup(&chip->base);
>
> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index 0ef209e1cd87..6aab57336690 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -2047,10 +2047,10 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
>                 /* Reserve one byte for the OMAP marker */
>                 oobbytes_per_step       = chip->ecc.bytes + 1;
>                 /* Software BCH library is used for locating errors */
> -               chip->ecc.priv          = nand_bch_init(mtd);
> -               if (!chip->ecc.priv) {
> +               err = nand_bch_init(chip);
> +               if (err) {
>                         dev_err(dev, "Unable to use BCH library\n");
> -                       return -EINVAL;
> +                       return err;
>                 }
>                 break;
>
> @@ -2089,10 +2089,10 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
>                 /* Reserve one byte for the OMAP marker */
>                 oobbytes_per_step       = chip->ecc.bytes + 1;
>                 /* Software BCH library is used for locating errors */
> -               chip->ecc.priv          = nand_bch_init(mtd);
> -               if (!chip->ecc.priv) {
> +               err = nand_bch_init(chip);
> +               if (err) {
>                         dev_err(dev, "unable to use BCH library\n");
> -                       return -EINVAL;
> +                       return err;
>                 }
>                 break;
>
> @@ -2272,7 +2272,7 @@ static int omap_nand_probe(struct platform_device *pdev)
>         if (!IS_ERR_OR_NULL(info->dma))
>                 dma_release_channel(info->dma);
>         if (nand_chip->ecc.priv) {
> -               nand_bch_free(nand_chip->ecc.priv);
> +               nand_bch_free(nand_chip);
>                 nand_chip->ecc.priv = NULL;
>         }
>         return err;
> @@ -2286,7 +2286,7 @@ static int omap_nand_remove(struct platform_device *pdev)
>         int ret;
>
>         if (nand_chip->ecc.priv) {
> -               nand_bch_free(nand_chip->ecc.priv);
> +               nand_bch_free(nand_chip);
>                 nand_chip->ecc.priv = NULL;
>         }
>         if (info->dma)
> diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
> index 1e1ee3af82b1..b62b8bd4669f 100644
> --- a/include/linux/mtd/nand-ecc-sw-bch.h
> +++ b/include/linux/mtd/nand-ecc-sw-bch.h
> @@ -10,7 +10,6 @@
>
>  struct mtd_info;
>  struct nand_chip;
> -struct nand_bch_control;
>
>  #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)
>
> @@ -30,11 +29,11 @@ int nand_bch_correct_data(struct nand_chip *chip, u_char *dat,
>  /*
>   * Initialize BCH encoder/decoder
>   */
> -struct nand_bch_control *nand_bch_init(struct mtd_info *mtd);
> +int nand_bch_init(struct nand_chip *chip);
>  /*
>   * Release BCH encoder/decoder resources
>   */
> -void nand_bch_free(struct nand_bch_control *nbc);
> +void nand_bch_free(struct nand_chip *chip);
>
>  #else /* !CONFIG_MTD_NAND_ECC_SW_BCH */
>
> @@ -54,12 +53,12 @@ nand_bch_correct_data(struct nand_chip *chip, unsigned char *buf,
>         return -ENOTSUPP;
>  }
>
> -static inline struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
> +static inline int nand_bch_init(struct nand_chip *chip)
>  {
> -       return NULL;
> +       return -ENOTSUPP;
>  }
>
> -static inline void nand_bch_free(struct nand_bch_control *nbc) {}
> +static inline void nand_bch_free(struct nand_chip *chip) {}
>
>  #endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
>
> --
> 2.20.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
