Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940C12FBBA6
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 16:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389251AbhASPun (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Jan 2021 10:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389698AbhASPue (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Jan 2021 10:50:34 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2BCC061573
        for <linux-omap@vger.kernel.org>; Tue, 19 Jan 2021 07:49:48 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id d13so37215684ioy.4
        for <linux-omap@vger.kernel.org>; Tue, 19 Jan 2021 07:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hIpriwXl3zmZUpuunNoIwO+z6DAxghi4lzMyGFl/QxM=;
        b=XVBXqr9J+XCU/wutNkoQGL/bywKx8LkKiPPRvEFLKDP4k6B0LHtQosMk3rqTDDzdfk
         WgAa+m9ONAzgcCLbm9NHc5cExA0TdkS525vp60hPJM4/al1Yg4kW7W6+rgB3k1O+hx55
         r+5w0VlexWdWmJgz7BYaFEVbX8vtL19vwlnvh7s0UbH2U4OccGMQNMCIwB2LpIYcl2Kw
         JTlfDmIcQgSQpbrYrtTDI6HQsg8RADhuKqwyVu1dkTUsEzzjefwaaNKHnEmRGuyjCK3z
         mBjYBOQQbrOyNadsHmj8oH3t8whP/0cngNQGuh81B6EU+osmTOK9v7tfsvswvWuH1KSm
         Uktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hIpriwXl3zmZUpuunNoIwO+z6DAxghi4lzMyGFl/QxM=;
        b=m3OCZvTEg3b8+qvHB2Ww+PPJ7VwQGVSka3SNV41Dl0pDpeUXoeyrrRCZcgnswyNW1a
         9mhdufOU/NgWbhHIxZrwvyOZYu1U05OpUHdAPgXjMM0YpA9L8Tn4QBcqZX+fKK1tBRbI
         JxD9mDEKZSoJ5kz7xewbSJMqUEYCa9IEZBFEX2sVEuWezGTArBIBohlr4luzsfrtmbVI
         S0XGUP9cDmaMxxVoLz+j07CJZ1Jvky0cMqqcm8d/TvUYs3ecR/foEGmQc9AvpN/PWWC1
         hd5DO23C4zR1oD2kcEkrqv1CR+fdKsuADYJOJ4aGs96IBFHIYCCTd6xFBrj/tu6nueN4
         oRJA==
X-Gm-Message-State: AOAM533uXaTs/1ZPp9IyR9Kx2yCOB8FdQcWY/IZ4aYbs61n48EckU0Dx
        ZTpq6/Hv9JfPvHVF8gb0KsBf7GhPNJETkbOUTnQ9mvujNZrbIg==
X-Google-Smtp-Source: ABdhPJwyQFNDbccIRNY3NNjfTozn5ITh0IyaJi53MNoVuDBrWPmeWhn/NxRRY0tQeje+KE33aD14Y0/FTw/8l60Tuvk=
X-Received: by 2002:a92:c26f:: with SMTP id h15mr3933796ild.65.1611071387640;
 Tue, 19 Jan 2021 07:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com> <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
 <20210114164224.5d21c170@xps13> <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
 <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
 <20210115171736.1c837c29@xps13> <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
 <20210119125634.6d4c5c1e@xps13> <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
 <20210119153521.7d5de79d@xps13>
In-Reply-To: <20210119153521.7d5de79d@xps13>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 19 Jan 2021 09:49:36 -0600
Message-ID: <CAHCN7xKtSwEDEXwU=df0FYzL0ivrWser0-kioW2BSrfU+XQFWQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jan 19, 2021 at 8:36 AM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Adam,
>
> > > ---8<---
> > >
> > > Author: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Date:   Tue Jan 19 12:27:07 2021 +0100
> > >
> > >     wip: fix omap
> > >
> > >     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > >
> > Thanks for fixing this.
> >
> > I tested your patch, and I no longer get a Panic and the MTD device
> > appears to appear correctly:
> >
> > mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> > omap2-nand 30000000.nand: GPIO lookup for consumer rb
> > omap2-nand 30000000.nand: using device tree for GPIO lookup
> > of_get_named_gpiod_flags: parsed 'rb-gpios' property of node
> > '/ocp@68000000/gpmc@6e000000/nand@0,0[0]' - status (0)
> > gpio gpiochip6: Persistence not supported for GPIO 0
> > nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > nand: Micron MT29F4G16ABBDA3W
> > nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > 6 cmdlinepart partitions found on MTD device omap2-nand.0
> > Creating 6 MTD partitions on "omap2-nand.0":
> > ...
>
> Good to know. Can you just tell me if the values of
> - chip->ecc.bytes vs. engine_conf->code_size
> - chip->ecc.steps vs. engine_conf->nsteps
> are the same in both cases (your patch and mine)? Otherwise your data
> might appear corrupted somehow.

I didn't fully vet my hack, beyond eliminating the Kernel panic, so I
felt more comfortable comparing the values to a stable release.
I compared the values in 5.10 to 5.11-rc4 + your patch, and the number
of steps and oobregion->length are identical between them.

5.10.5:
  chip->ecc.steps =3D 4
  oobregion->length =3D d

5.11-rc4 + patch:
  engine_conf->nsteps =3D 4
  oobregion->length =3D d

adam
>
> >
> > When you submit a formal patch, CC me on the patch, and I'll respond
> > with a 'tested-by'
>
> Of course, I'll also add a Reported-by.
>
> Thanks,
> Miqu=C3=A8l
