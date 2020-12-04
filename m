Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CB92CEF98
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 15:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgLDOP2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 09:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgLDOP1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 09:15:27 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AD9C061A4F
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 06:14:47 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id 7so3973533qtp.1
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 06:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S84fLM5R0eFjhFKwNgg6t4YhV/zLIcH5ndZplGJKCzk=;
        b=FP5hEdFsRSIYWxa3GBQxUIGiNfZW+RsNpvHY7m/q1DyyPbkND79VQBJWckEaVPjjZX
         sjVd87SJ9MmGox3RADjhpP0A/HOIdjZx5PlqGuF/leZGa8Bw/hx86RIAxlUTGGNwb27a
         +D1UO8CRuCEHwqrUcs06O+mIP/Kl1f80FHBxnrnHZSHst9PPcCCW59+3D2WWaRDpvh7q
         dZcTkLPX5qwzBiYsuGZ/FQZBVeSfSHPNXckqXqUBtVGXF1hLAeYjzKbam9vXszZKt3Mi
         WFbamiWmqxuepukArl5+g2yCh1igyXRSe/T9bOtldmrgSxp+/gqwTn231YA/o7PBoBCl
         5cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S84fLM5R0eFjhFKwNgg6t4YhV/zLIcH5ndZplGJKCzk=;
        b=OGXUbdsuuPJnakACD0Zew2MpxGy6BbBWZXqjxHPclSd4fDT8sMc7TiA4LBWdqIfHBt
         6biL5YXgipQH7456FuaC8Ezqi89wwfpXfXAUIH4KhOy+rIhS9xtnuNuLa7h2WQCpFvEz
         3DLUKhGmhyJVGz+jT/sXPdzZmwih/Ab3mCD2OLTfzDiD2UJkm1h47qudO2SOVZ+TMny4
         5XnMztiN/bfdS95k3NKdNutTtdYE8RVa1h8YE4WfzpIKylGUCxaFE275toWgScrS2Psq
         IJORcEVa6jgtPcd1Eqs+rvkK7wN17vnS0SCHZhGOh6/+P2aPrxx3QAdLkitClpKeo+S1
         b6Uw==
X-Gm-Message-State: AOAM531qz6Z0tiuO5f3YPUj3n3vWoD0Tgdx4s8s8D+vZjK0EgOKFaDvG
        PVNaH4QyESIFHIkpZ6k5k/2eqdEjOC5o0sw/gMt8lA==
X-Google-Smtp-Source: ABdhPJwdyeC4GEux7iJupu+IbCVt8JIddUtBx9AF0hehts+m24vl3ICE698dbMxZN1MoyOrNL7phD3GbsGer4ueulyg=
X-Received: by 2002:ac8:6b9a:: with SMTP id z26mr9626192qts.200.1607091286490;
 Fri, 04 Dec 2020 06:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-7-grzegorz.jaszczyk@linaro.org> <20201203185332.GC1392978@xps15>
In-Reply-To: <20201203185332.GC1392978@xps15>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 4 Dec 2020 15:14:35 +0100
Message-ID: <CAMxfBF5xaBd2Dm9fpJD+eS_x2Q9-5Ub6iHTRetgt9Ce8vZChqQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] remoteproc/pru: Add support for various PRU cores
 on K3 J721E SoCs
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mathieu,

On Thu, 3 Dec 2020 at 19:53, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> On Thu, Nov 19, 2020 at 03:08:50PM +0100, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The K3 J721E family of SoCs have a revised version of the AM65x ICSSG IP
> > and contains two instances of this newer ICSSG IP. Each ICSSG processor
> > subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called RTUs,
> > and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).
> >
> > Enhance the existing PRU remoteproc driver to support these new PRU
> > and RTU cores by using specific compatibles. The cores have the same
> > memory copying limitations as on AM65x, so reuses the custom memcpy
> > function within the driver's ELF loader implementation. The initial
> > names for the firmware images for each PRU core are retrieved from
> > DT nodes, and can be adjusted through sysfs if required.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thank you for all your review,
Grzegorz

>
> > ---
> >  drivers/remoteproc/pru_rproc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> > index 48c1c51e0d42..96f689283a8b 100644
> > --- a/drivers/remoteproc/pru_rproc.c
> > +++ b/drivers/remoteproc/pru_rproc.c
> > @@ -852,6 +852,9 @@ static const struct of_device_id pru_rproc_match[] = {
> >       { .compatible = "ti,am654-pru",         .data = &k3_pru_data },
> >       { .compatible = "ti,am654-rtu",         .data = &k3_rtu_data },
> >       { .compatible = "ti,am654-tx-pru",      .data = &k3_tx_pru_data },
> > +     { .compatible = "ti,j721e-pru",         .data = &k3_pru_data },
> > +     { .compatible = "ti,j721e-rtu",         .data = &k3_rtu_data },
> > +     { .compatible = "ti,j721e-tx-pru",      .data = &k3_tx_pru_data },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, pru_rproc_match);
> > --
> > 2.29.0
> >
