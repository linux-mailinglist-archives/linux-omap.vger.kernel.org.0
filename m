Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7D08F698
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 23:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbfHOVpr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 17:45:47 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45938 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732069AbfHOVpr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 17:45:47 -0400
Received: by mail-io1-f68.google.com with SMTP id t3so2212170ioj.12
        for <linux-omap@vger.kernel.org>; Thu, 15 Aug 2019 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W7dmVx9P3UmAPzrTGPH5uSZ0QIPuvEvdrwJSpH7T3YU=;
        b=UvwFCeQKWgS/IzuUPPn7RfklN9Zql/GyFk3V5sgSbz2HeSVkZYyq0PTQDP8elVLf61
         ljLjFz7YJVupCG3J2uKCQzPuDrqnMJ4E4Vnk9wJB258peyYWcBw3G/osZCBm1Nf91I9H
         L0T9yvYbxJHk4tRKEjLNCOXrzeaaOsRKkKPsHwdyvWwg/PwJZPPsUJTz5k1E/ExnsxZM
         GkoX7d2lz+45p430ZDhqxV3DVYrZi3bnvL0KTwtHyCIA9JUc/mu6cp5lydcJZT2Lab28
         mT0Xcy+vAVvDncmrAkZHqUHqflPpFUTsJ/OQnam5WI0JyPPW9XpQKkOQJ8jtqvy14zR/
         jOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W7dmVx9P3UmAPzrTGPH5uSZ0QIPuvEvdrwJSpH7T3YU=;
        b=SWXJL/LdonB7SQRTI605MSksrrPoUDmfj74LbGkny04HC7UfW2yFW0qYAzQwmMjgLJ
         eWW1rDTlA0dPiXhAIB5MoqtNhAwpIEIrFdijb+lssRVkMQ8t+WOlDE+exASwAhd14vyN
         Fi1nitgQqpz7Ak6TAvTAi1gjt98XgQozuIipqmxRPyez8Y4mQa1vHQo6zHP2W7+bH8In
         l3f13YPeGAquzawazggnOVWO7ju3oWwQ6qGj05q0ABujGBG2tiFQSbzA6zQ6aAPS8me1
         N4DiS/E9AjGSE5nRrtpq2UsnXhTF+qegU+sO88liiPi+LcF/VF7pqiyYWBcizz7nSqB4
         vWug==
X-Gm-Message-State: APjAAAUvuTJlyPrrp7cwrM5WSHPaqAX96L1zUbCuSPI3fA/1e8P174dO
        Uc473+kZ/v8zshd72+71+2LDrtPqPiPN3g7u9zCbzjXhSz4=
X-Google-Smtp-Source: APXvYqw024JdkHU1Vq7Jj2RVlCcUWewGB1WJ/BRHOvh0QqIvc/fLkTEH/2UWUcIRb/+hbFyBm5liQ9IiJqQGX4NoItI=
X-Received: by 2002:a6b:621a:: with SMTP id f26mr7207565iog.127.1565905545802;
 Thu, 15 Aug 2019 14:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
In-Reply-To: <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 15 Aug 2019 16:45:34 -0500
Message-ID: <CAHCN7x+aAOOAik6QyAbhc0_Q_sDa3+Jh70vQBp=3CmAv-dLMdw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 15, 2019 at 10:41 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Wed, Jul 31, 2019 at 8:42 PM Andr=C3=A9 Roth <neolynx@gmail.com> wrote=
:
> >
> > Hi all,
> >
> > the current mainline kernel does not provide support for running
> > omap36xx based boards at 1GHz for chips like DM3730 where this would be
> > supported. It has been discussed many times, I hope you do not mind me
> > bringing this up again ;)
> >
> > I found some proposed patches by Nishanth Menon from TI [1] and a
> > statement [2] that drivers for the Voltage processor and controllers ar=
e
> > needed to properly run those chips at 1GHz using Adaptive Voltage
> > Scaling (AVS) and SmartReflex (SR).
> >
> > As there are drivers for VP and VC in the kernel, I tried to figure out
> > how to enable them and found a PATCH 1/3 which enables SR in the TWL
> > driver. However, the order in which PM, SR and TWL are initialized or
> > probed did not match, which I was able to fix with PATCH 2/3. In the en=
d
> > calling omap_sr_enable in PATCH 3/3 finally enables SR and my board
> > seems to run fine at 1GHz (not battery powered, full performance
> > required).
> >

With this patch,

[    3.361358] omap2_set_init_voltage: unable to set vdd_mpu_iva
[    3.367156] omap2_set_init_voltage: unable to find boot up OPP for vdd_c=
ore
[    3.374206] omap2_set_init_voltage: unable to set vdd_core
and
[    3.414978] smartreflex 480cb000.smartreflex: omap_sr_probe:
SmartReflex driver initialized
[    3.423919] smartreflex 480c9000.smartreflex: omap_sr_probe:
SmartReflex driver initialized

Is there anything I need to do to make it be able to set vdd_core
and/or vdd_mpu_iva?

I also applied which also fixed

https://patchwork.kernel.org/patch/11094653/

I should not that I am running an 800MHz version of the DM3730, but I
have a 1000 MHz somewhere at work.  I wasn't sure if this is normal or
if I needed to do something else.

adam

>
> Question:
>
> Not all 36xx SoC's can do 1GHz.  I know there is a register that we
> can read on the OMAP36 to determine its max speed, but I wasn't sure
> how that would play into cpufreq or whatever is going to be driving
> the dynamic voltage and frequency scaling.  Are going to have to
> expect people who have the 1GHz version to use a custom device tree?
> AFAICT, there is an updated opp-v2-ti table which has a 'supported'
> entry which appears to read registers to determine which opp's are
> available for the am33xx, but I don't think this applies to the
> omap36.  Do we need something that like for this?
>
> adam
>
> > Looking at a register dump on DM3730, I can see that VP, VC1 and SR1 ar=
e
> > enabled:
> >
> > Global PRM_VC_SMPS_SA     [0x48307220]: 0x00120012  0000000000010010000=
0000000010010
> > Global PRM_VC_SMPS_VOL_RA [0x48307224]: 0x00010000  0000000000000001000=
0000000000000
> > Global PRM_VC_SMPS_CMD_RA [0x48307228]: 0x00000000  0000000000000000000=
0000000000000
> > Global PRM_VC_CMD_VAL_0   [0x4830722C]: 0x3E201E00  0011111000100000000=
1111000000000
> > Global PRM_VC_CMD_VAL_1   [0x48307230]: 0x30201E00  0011000000100000000=
1111000000000
> > Global PRM_VC_CH_CONF     [0x48307234]: 0x00130008  0000000000010011000=
0000000001000
> > Global PRM_VC_I2C_CFG     [0x48307238]: 0x00000008  0000000000000000000=
0000000001000
> > Global PRM_VC_BYPASS_VAL  [0x4830723C]: 0x00000000  0000000000000000000=
0000000000000
> > Global PRM_RSTCTRL        [0x48307250]: 0x00000000  0000000000000000000=
0000000000000
> > Global PRM_RSTTIME        [0x48307254]: 0x00001006  0000000000000000000=
1000000000110
> > Global PRM_RSTST          [0x48307258]: 0x00000001  0000000000000000000=
0000000000001
> > Global PRM_VOLTCTRL       [0x48307260]: 0x0000000A  0000000000000000000=
0000000001010
> > Global PRM_SRAM_PCHARGE   [0x48307264]: 0x00000050  0000000000000000000=
0000001010000
> > Global PRM_CLKSRC_CTRL    [0x48307270]: 0x00000088  0000000000000000000=
0000010001000
> > Global PRM_OBS            [0x48307280]: 0x00000000  0000000000000000000=
0000000000000
> > Global PRM_VOLTSETUP1     [0x48307290]: 0x00700070  0000000001110000000=
0000001110000
> > Global PRM_VOLTOFFSET     [0x48307294]: 0x00000010  0000000000000000000=
0000000010000
> > Global PRM_CLKSETUP       [0x48307298]: 0x00000148  0000000000000000000=
0000101001000
> > Global PRM_POLCTRL        [0x4830729C]: 0x00000002  0000000000000000000=
0000000000010
> > Global PRM_VOLTSETUP2     [0x483072A0]: 0x00000000  0000000000000000000=
0000000000000
> > Global PRM_VP1_CONFIG     [0x483072B0]: 0x00273E09  0000000000100111001=
1111000001001
> > Global PRM_VP1_VSTEPMIN   [0x483072B4]: 0x00002901  0000000000000000001=
0100100000001
> > Global PRM_VP1_VSTEPMAX   [0x483072B8]: 0x00002904  0000000000000000001=
0100100000100
> > Global PRM_VP1_VLIMITTO   [0x483072BC]: 0x42140A28  0100001000010100000=
0101000101000
> > Global PRM_VP1_VOLTAGE    [0x483072C0]: 0x00000034  0000000000000000000=
0000000110100
> > Global PRM_VP1_STATUS     [0x483072C4]: 0x00000001  0000000000000000000=
0000000000001
> > Global PRM_VP2_CONFIG     [0x483072D0]: 0x00000008  0000000000000000000=
0000000001000
> > Global PRM_VP2_VSTEPMIN   [0x483072D4]: 0x00002901  0000000000000000001=
0100100000001
> > Global PRM_VP2_VSTEPMAX   [0x483072D8]: 0x00002904  0000000000000000001=
0100100000100
> > Global PRM_VP2_VLIMITTO   [0x483072DC]: 0x2C180A28  0010110000011000000=
0101000101000
> > Global PRM_VP2_VOLTAGE    [0x483072E0]: 0x00000000  0000000000000000000=
0000000000000
> > Global PRM_VP2_STATUS     [0x483072E4]: 0x00000001  0000000000000000000=
0000000000001
> > Global PRM_LDO_ABB_SETUP  [0x483072F0]: 0x00000000  0000000000000000000=
0000000000000
> > Global PRM_LDO_ABB_CTRL   [0x483072F4]: 0x00003201  0000000000000000001=
1001000000001
> > PRCM   SRCONFIG           [0x480C9000]: 0x00041E03  0000000000000100000=
1111000000011
> > PRCM   SRSTATUS           [0x480C9004]: 0x0000000A  0000000000000000000=
0000000001010
> > PRCM   SENVAL             [0x480C9008]: 0x064A0715  0000011001001010000=
0011100010101
> > PRCM   SENMIN             [0x480C900C]: 0xFFFFFFFF  1111111111111111111=
1111111111111
> > PRCM   SENMAX             [0x480C9010]: 0x00000000  0000000000000000000=
0000000000000
> > PRCM   SENAVG             [0x480C9014]: 0x00000000  0000000000000000000=
0000000000000
> > PRCM   AVGWEIGHT          [0x480C9018]: 0x00000000  0000000000000000000=
0000000000000
> > PRCM   NVALUERECIPROCAL   [0x480C901C]: 0x00AAA699  0000000010101010101=
0011010011001
> > PRCM   IRQSTATUS_RAW      [0x480C9024]: 0x00000006  0000000000000000000=
0000000000110
> > PRCM   IRQSTATUS          [0x480C9028]: 0x00000000  0000000000000000000=
0000000000000
> > PRCM   IRQENABLE_SET      [0x480C902C]: 0x00000000  0000000000000000000=
0000000000000
> > PRCM   IRQENABLE_CLR      [0x480C9030]: 0x00000000  0000000000000000000=
0000000000000
> > PRCM   SENERROR_REG       [0x480C9034]: 0x0000FDFD  0000000000000000111=
1110111111101
> > PRCM   ERRCONFIG          [0x480C9038]: 0x064402FA  0000011001000100000=
0001011111010
> >
> > @Nishanth: could you confirm that DM3730 (1GHz version) is properly
> > configured for running at 1GHz ? (I know this is a tricky question and
> > has been asked before...)
> >
> > As this is just a hack, I would like to know how to properly
> > initialize those driver in the right order, preferably via device tree
> > or kernel config instead of a board file.
> >
> > Also, SR2 (vcore) is not enabled, as no OPPs are defined in the device
> > tree. I assume it would require 1.2V at 200MHz but could not find any
> > reference to that.
> >
> >
> > [1] https://marc.info/?l=3Dlinux-kernel&m=3D137185002523884&w=3D2
> > [2] https://patchwork.kernel.org/patch/9526883/#20026873
> > [3] https://marc.info/?l=3Dlinux-omap&m=3D129584746102725&w=3D2
> >
> > [PATCH 1/3] OMAP3: PM: Set/clear T2 bit for Smartreflex on TWL
> > [PATCH 2/3] OMAP: Initialize PM and SmartReflex after TWL probe
> > [PATCH 3/3] OMAP3: Enable SmartReflex on om36xx
> >
> >
