Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED9641187FC
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 13:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfLJM0L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 07:26:11 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38275 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfLJM0L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Dec 2019 07:26:11 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so19615014ljh.5
        for <linux-omap@vger.kernel.org>; Tue, 10 Dec 2019 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ssjTQd0P++XuTu6jcfq+Wbl9Qau8BOaHBPqrn5VTkw=;
        b=XnJ4Gv6WPvlrJLmH9WmMMvYNFbzCVErXXyYxwXo2ks6RSGWqT801lva9NeoY+0cscF
         F3JjetruQbMOwDjT679SQwof1I/p2YiBSITB3qnkUQxBa/+W0ybmeYx3c6uqG00mmk0Y
         cdasf06Yyepi1CBn/AFHPaJLR96uUVip3Hfr8/PTtuK866JHxXdV3hxI/6kM4KESvcMf
         TVg0Q7bg1vjd+A7ru18A1W3BJgp1e2jpvYHTuyDcoUEkaB2yi1rlLoGBYHF+8Z5z/6HB
         KqsGavCwG+nplYrEkH7W7BljS1DQOxC4tB4OEXnyQqyXZFyp6a/FgfrdYOVzS1X70cY4
         poVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ssjTQd0P++XuTu6jcfq+Wbl9Qau8BOaHBPqrn5VTkw=;
        b=OXPptzOVNR/nQ2uinTZV4m0AeYqEAXw3AjOl6acNrYgnlonjR4y4BCHl79TVSp5DUm
         vPO0u+X4CCn/8B9zq9HXDWD1hK4BIynHMI5ylAsaTKVLYYq6OJco6HTlnW4J8YkJbLHD
         MDmh47Po0tpVs0dwTGiT8xlnU4CFgkrjtnZgCn/miOqRMpluoJ8ne+stm3sSyr2pzDT5
         lpJ//HuVFwOgtmbno9iUPCsB/fTIyMlKniGlOxFE1BmSrH7ATbtFgyr2Buf56ixw4ouC
         9RLIWYDKbw7nbTPP6ro2D0VEKlbIX6yC6eBDB8+ow16eUp05euBpBK+j4XKAr4hKkyNm
         ug+A==
X-Gm-Message-State: APjAAAW6gvQ/8OEBX7g9hGdgKtliu39I/aRlOIArgsAuEwQh0ceu9/N7
        g7K2hwTEwLPBwK9PQ2dKlqYsXSANB1UYeZpHOGWOuA==
X-Google-Smtp-Source: APXvYqyUUcJBW7CYt/1G5RSKV+lqgF3fKiPfLSOHhUb2nA3LJQSzHo4AFRzP4mbYFdJuhBIzcIs/1G06oIlqqXhFUIA=
X-Received: by 2002:a2e:9a93:: with SMTP id p19mr20555785lji.158.1575980766922;
 Tue, 10 Dec 2019 04:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20191206160007.331801-1-jean.pihet@newoldbits.com>
 <20191206160007.331801-4-jean.pihet@newoldbits.com> <2efd2981-73d1-6975-a385-871809ec43f1@ti.com>
In-Reply-To: <2efd2981-73d1-6975-a385-871809ec43f1@ti.com>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Tue, 10 Dec 2019 13:25:56 +0100
Message-ID: <CAORVsuU8b1-50STYAbY7CJ-VkLWXHbEz0dDCfLYfS4YM36vSgg@mail.gmail.com>
Subject: Re: [PATCH 3/3] TI QSPI: optimize transfers for dual and quad read
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-spi@vger.kernel.org,
        Ryan Barnett <ryan.barnett@rockwellcollins.com>,
        Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Vignesh,

On Tue, Dec 10, 2019 at 9:40 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
>
>
> On 06/12/19 9:30 pm, Jean Pihet wrote:
> > By reading the 32 bits data register and copy the contents to the
> > receive buffer, according to the single/dual/quad read mode and
> > the data length to read.
> >
> > The speed improvement is 3.5x using quad read.
> > ---
> >  drivers/spi/spi-ti-qspi.c | 48 ++++++++++++++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> > index 13916232a959..65ec3bcb25ae 100644
> > --- a/drivers/spi/spi-ti-qspi.c
> > +++ b/drivers/spi/spi-ti-qspi.c
> > @@ -313,24 +313,25 @@ static int qspi_write_msg(struct ti_qspi *qspi, struct spi_transfer *t,
> >  static int qspi_read_msg(struct ti_qspi *qspi, struct spi_transfer *t,
> >                        int count)
> >  {
> > -     int wlen;
> >       unsigned int cmd;
> > +     u32 rx;
> >       u8 *rxbuf;
> > +     u8 xfer_len;
> >
> >       rxbuf = t->rx_buf;
> >       cmd = qspi->cmd;
> > +     /* Optimize the transfers for dual and quad read */
> >       switch (t->rx_nbits) {
> > -     case SPI_NBITS_DUAL:
> > -             cmd |= QSPI_RD_DUAL;
> > -             break;
> >       case SPI_NBITS_QUAD:
> > -             cmd |= QSPI_RD_QUAD;
> > +             cmd |= QSPI_RD_QUAD | QSPI_WLEN(32);
>
> Why does QUAD mode mean 32 bit words?
This is based on the assumption that every transfer is multiple of 8
clock cycles.
For SPI flash devices where bits_per_word is 8, the original code
always reads data by 1 byte, which
can be optimized.

>
> IO mode and word size are independent of each other. If you want to
> optimize for speed, why not set FLEN field to max and WLEN to max and
> use ti_qspi_adjust_op_size to clamp max read size to 4096 words when
> required. This should work irrespective of IO modes.
> Driver already does something similar to this in the write path.

Ok! A new patch series is coming.

>
> > +             break;
> > +     case SPI_NBITS_DUAL:
> > +             cmd |= QSPI_RD_DUAL | QSPI_WLEN(16);
> >               break;
> >       default:
> > -             cmd |= QSPI_RD_SNGL;
> > +             cmd |= QSPI_RD_SNGL | QSPI_WLEN(8);
> >               break;
> >       }
> > -     wlen = t->bits_per_word >> 3;   /* in bytes */
> >
> >       while (count) {
> >               dev_dbg(qspi->dev, "rx cmd %08x dc %08x\n", cmd, qspi->dc);
> > @@ -342,19 +343,34 @@ static int qspi_read_msg(struct ti_qspi *qspi, struct spi_transfer *t,
> >                       dev_err(qspi->dev, "read timed out\n");
> >                       return -ETIMEDOUT;
> >               }
> > -             switch (wlen) {
> > -             case 1:
> > -                     *rxbuf = readb(qspi->base + QSPI_SPI_DATA_REG);
> > +
> > +             /* Optimize the transfers for dual and quad read */
> > +             rx = readl(qspi->base + QSPI_SPI_DATA_REG);
> > +             switch (t->rx_nbits) {
> > +             case SPI_NBITS_QUAD:
> > +                     if (count >= 1)
> > +                             *rxbuf++ = rx >> 24;
> > +                     if (count >= 2)
> > +                             *rxbuf++ = rx >> 16;
> > +                     if (count >= 3)
> > +                             *rxbuf++ = rx >> 8;
> > +                     if (count >= 4)
> > +                             *rxbuf++ = rx;
> > +                     xfer_len = min(count, 4);
> >                       break;
> > -             case 2:
> > -                     *((u16 *)rxbuf) = readw(qspi->base + QSPI_SPI_DATA_REG);
> > +             case SPI_NBITS_DUAL:
> > +                     if (count >= 1)
> > +                             *rxbuf++ = rx >> 8;
> > +                     if (count >= 2)
> > +                             *rxbuf++ = rx;
> > +                     xfer_len = min(count, 2);
> >                       break;
> > -             case 4:
> > -                     *((u32 *)rxbuf) = readl(qspi->base + QSPI_SPI_DATA_REG);
> > +             default:
> > +                     *rxbuf++ = rx;
> > +                     xfer_len = 1;
> >                       break;
>
> This will fail in case of t->rx_nbits = 1 and t->bits_per_word = 32
> (1 bit SPI bus bit slave with 32-bit addressable registers)
I do not see why this would fail. If bits_per_word is 32, count (in
bytes) is a multiple of 4 and 1 byte will be read every time the loop
runs.
Is that correct? Can you elaborate more on why this would fail?

Thanks for reviewing, regards,
Jean

>
> bits_per_word indicate the address granularity within SPI Slave
> (represented by WLEN field in TI QSPI) and rx_nbits tells about buswidth
> (bits received per bus clock)
>
> >               }
> > -             rxbuf += wlen;
> > -             count -= wlen;
> > +             count -= xfer_len;
> >       }
> >
> >       return 0;
> >
>
> --
> Regards
> Vignesh
