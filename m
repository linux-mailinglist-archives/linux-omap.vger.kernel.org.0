Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F77239C3B
	for <lists+linux-omap@lfdr.de>; Sun,  2 Aug 2020 23:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgHBVlS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 2 Aug 2020 17:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgHBVlR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 2 Aug 2020 17:41:17 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EAEC061756
        for <linux-omap@vger.kernel.org>; Sun,  2 Aug 2020 14:41:17 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 6so26977304qtt.0
        for <linux-omap@vger.kernel.org>; Sun, 02 Aug 2020 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+vVrgGh+FKZTumikQLMQ5VD9iTv9jTO6F54b15uPxzM=;
        b=xfbCE69Roj++5y5XnvMOHsfu8LuLC5xeKYXMtwBooQr2QX0KopA2KI/E0cKhjagW/W
         X6K4icziYVsSDLZXERIsop5RzhiCu25uLk2hp8/FAXI6QI7hq9BzsD1BBJD4489Uc0BM
         V54UJwzQwhVMxMKG3/S+sTPGQto2Yrp1FeOjky6+2r46/Kpa2R0nG/njEjrT1vl7FHDj
         GrP/H8rGR+gbCQutnQRvYdh+tbJpMSgKgsoSx27ZOX2qBHTb4onj8XUZ9MVBVmoSinmf
         PwLCENu+f5AJY/EvH2JgnmZuZHNVsl2XzupC1Jc1sCCqYtKE+XXIM/OS7jIWSFwzQrXb
         CJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+vVrgGh+FKZTumikQLMQ5VD9iTv9jTO6F54b15uPxzM=;
        b=narBOywCaddI5v6EX2EZS3R1x0Fy6uQkBYQkgDefD73R018XazgehfkipWSx6DRxAw
         qP/P3XrO81gSbA1yM7rfqZMa90yPC/AgMQL2jYwqpoL/bVqWEJltiRC+na9Vz38/z18a
         iV/CGtBZ+jUJM+SHL/K6Yuey8SdZ4XE9BZFKdtKdqkmDMeeBtcjXOOxt14Pdig+LnGPH
         7eGabkYHp7SdCdK2X0fJvygDGMHzOUd5CatWi/D0yozg6kdXMP/E9/71fLAXxnZQdhj/
         3b09DyLzsO7Z3eTU27LadtR6+Oel6z+eNwUTwk8OITloRyAvoY7wV1BWuI+T8hsSTf8r
         B0sQ==
X-Gm-Message-State: AOAM530jwd0rQ82kwgpsApZs+aiSzgL6Xn6vs9+muXNy2vMYKpZB6Moi
        dobGF3Ohw+8TioI3wm3Rzw3D78gRZT8DLOYKuO4IJw==
X-Google-Smtp-Source: ABdhPJzLUGvqAlacqIPSypPacSsR69kygSTFzmoRBFfCoX8+sQpcUqzLggUFnqzw5BRSxMAFINx/e3Qn19Lp2pQreqY=
X-Received: by 2002:aed:22cb:: with SMTP id q11mr11268953qtc.200.1596404476604;
 Sun, 02 Aug 2020 14:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <20200802115330.GA1090@bug> <20200802115701.GD1162@bug>
In-Reply-To: <20200802115701.GD1162@bug>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Sun, 2 Aug 2020 23:41:05 +0200
Message-ID: <CAMxfBF6k9wK1iPd7b42xGfDsG5rOBV2rWmVeWxY4UKTTwjSPDQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add TI PRUSS platform driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     ssantosh@kernel.org, "Anna, Suman" <s-anna@ti.com>,
        santosh.shilimkar@oracle.com, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Mills, William" <wmills@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

On Sun, 2 Aug 2020 at 13:57, Pavel Machek <pavel@ucw.cz> wrote:
>
> On Sun 2020-08-02 13:53:30, Pavel Machek wrote:
> > Hi!
> >
> > > A typical usage scenario would be to load the application firmware into one or
> > > more of the PRU cores, initialize one or more of the peripherals and perform I/O
> > > through shared RAM from either a kernel driver or directly from userspace.
> > >
> > > This series contains the PRUSS platform driver. This is the parent driver for
> > > the entire PRUSS and is used for managing the subsystem level resources like
> > > various memories and the CFG module.  It is responsible for the creation and
> > > deletion of the platform devices for the child PRU devices and other child
> > > devices (like Interrupt Controller, MDIO node and some syscon nodes) so that
> > > they can be managed by specific platform drivers.
> >
> > >  drivers/soc/ti/Kconfig | 11 + drivers/soc/ti/Makefile | 1 + drivers/soc/ti/pruss.c |
> >
> > Is drivers/soc right place for that? We already have subsystem for various
> > programmable accelerators...
>
> ....see drivers/remoteproc.

Yes I am aware of that and remoteproc sub-system will be used but only
for managing PRU cores (drivers/remoteproc/pru-rproc - will be
submitted soon), while this driver is the parent driver for the entire
PRUSS (used for managing the subsystem level resources like various
memories and the CFG module). This driver is also responsible for
populating all child devices (described in DT), managed by specific
(and separate) drivers: e.g.:
- PRU core will be managed by drivers/remoteproc/pru-rproc (will be
submitted next)
- PRU interrupt controller will be managed by
drivers/irqchip/irq-pruss-intc.c (it is already under review)
etc.

Best regards,
Grzegorz
