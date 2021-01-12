Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7221D2F34F1
	for <lists+linux-omap@lfdr.de>; Tue, 12 Jan 2021 17:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404233AbhALQB6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Jan 2021 11:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbhALQB5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Jan 2021 11:01:57 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E02DC061575
        for <linux-omap@vger.kernel.org>; Tue, 12 Jan 2021 08:01:17 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id e22so5097777iom.5
        for <linux-omap@vger.kernel.org>; Tue, 12 Jan 2021 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H4iptpFz9x8ijlokMB7X7COj1wHjmyUOyfdacgf3XzI=;
        b=ft+I+RYLBgBfLxCnZfVpdrQ55vEqPZRTi3Kx97saG1Np5j8NHyS+6SnkjIBuaBqKp8
         EHROL5fqv+nW2RfSxWC0QAx8KRhZf8hPUnVJwR+gB7IULIfP97KE125HfNpE5tDbWqf7
         UvfDXOLhZ2uz7gZ00sCWAiguwOkHWMHSC1gyl8jYINm4uzVFimkR6sru7z+hZJ78Asjh
         6b4wmo0vF4kozsoy8Syn8EROBsfx9jaOCyGNc9eP9+4CPaGFn/nXP5Gg3x2304dbMtjn
         sh36NlDIDfvT2g7O0YIcXbcRuOd4q760pCr0t6+60IcwWo1trtXJ3ziKSn+KZpdgQN2C
         M52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H4iptpFz9x8ijlokMB7X7COj1wHjmyUOyfdacgf3XzI=;
        b=I2lquxju4QYXdA1EDvehSopkC5IlWnldD9gJ7LarutYHxK4HJ6PQnIBQNIiGgH9snL
         GZ1bFt2Iy1RUumrXqQDQChafskjltlPamSPFCqzcz39698siN1gMEW0HVRavRpZ83D47
         Gs7VcENcOfWvVPKLGuxl7PT+d1MlK8j/MTdx8lhrXwRG0x6OEnkx+wkZsR6nYdETp2Sy
         /k0bCPkbxhNIIhNkNk3b3fLxtlA3ErFnUVzf75rUK31erX6vAhlsvkrHOmsy5C/Fdoqw
         nRG41SJbjx6LpCU74d2s7TmOzBvaDnWDa/md2UsVjcz5NTFVUQeGPcjz2QqDtazfzU2R
         YnAg==
X-Gm-Message-State: AOAM531X0mluYDhDc8oMsXhH3MJ5+Y2XER2G9veUD9mIm0OqhC3T3uZ5
        Z41jL5xBj8C+mJUqvx9IUyJXZNJR3v229KhYsU4iNOrDCWI=
X-Google-Smtp-Source: ABdhPJwu6RG/zzz1uhuU21p7AfKRzg0ukodScivw42XTEtEKfn3JzKV74YKYzntxhMEHRS9UwXkOvnlHniFVy8Zuqdc=
X-Received: by 2002:a05:6638:50c:: with SMTP id i12mr66712jar.74.1610467276750;
 Tue, 12 Jan 2021 08:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com> <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
In-Reply-To: <20210112153534.5ba93cde@xps13>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 12 Jan 2021 10:01:04 -0600
Message-ID: <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
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

On Tue, Jan 12, 2021 at 8:35 AM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Adam,
>
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 11 Jan 2021
> 11:20:27 +0100:
>
> > Hi Adam,
> >
> > Adam Ford <aford173@gmail.com> wrote on Sat, 9 Jan 2021 08:46:44 -0600:
> >
> > > On Tue, Sep 29, 2020 at 6:09 PM Miquel Raynal <miquel.raynal@bootlin.=
com> wrote:
> > > >
> > > > The NAND BCH control structure has nothing to do outside of this
> > > > driver, all users of the nand_bch_init/free() functions just save i=
t
> > > > to chip->ecc.priv so do it in this driver directly and return a
> > > > regular error code instead.
> > > >
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > ---
> > >
> > > Starting with this commit:  3c0fe36abebe, the kernel either doesn't
> > > build or returns errors on some omap2plus devices with the following
> > > error:
> > >
> > >     nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xbc
> > >     nand: Micron MT29F4G16ABBDA3W
> > >     nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB siz=
e: 64
> > >     nand: using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> > >     Invalid ECC layout
> > >     omap2-nand 30000000.nand: unable to use BCH library
> > >     omap2-nand: probe of 30000000.nand failed with error -22
> > >     8<--- cut here ---
> > >
> > > There are few commits using git bisect that have build errors, so it
> > > wasn't possible for me to determine the exact commit that broke the
> > > ECC.  If the build failed, I marked it as 'bad' to git bisect.
> >
> > I am sorry to hear that, I regularly rebase with a make run between eac=
h
> > pick and push my branches to a 0-day repository to have robots check
> > for such errors, but sometimes I fail.
> >
> > > Newer commits have remedied the build issue, but the Invalid ECC
> > > layout error still exists as of 5.11-RC2.
> >
> > Ok so let's focus on these.
> >
> > > Do you have any suggestions on what I can do to remedy this?  I am
> > > willing to try and test.
> >
> > Glad to hear that.
> >
> > Can you share the NAND controller DT node you are using?
> >
> > Also, can you please add a few printk's like below and give me the
> > output?
>
> Will you have the time to check these soon? I am ready to help and
> would like to fix it asap.

Sorry for the delay, I have to split my time with 3 different
projects.  I am hoping to get you data later today.

adam
>
> Cheers,
> Miqu=C3=A8l
