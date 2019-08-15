Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 212D88EF94
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 17:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbfHOPlv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 11:41:51 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38726 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729975AbfHOPlv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 11:41:51 -0400
Received: by mail-ot1-f68.google.com with SMTP id r20so6856839ota.5
        for <linux-omap@vger.kernel.org>; Thu, 15 Aug 2019 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KRuxjqTYbnBKXKobdi0fccXY7HVuk0DaVGKwwr2eM3Q=;
        b=cxAY/MovUKFr0tniH2mi3nLAo2yg6UmvoyCR8B5mG7CoPinYgKg+eAaK453I48psk8
         p2A6smPUkOQXIj56tY6NNuM/iVCmDUg78xQ+9+eQd25ia6+uQXnTMgJ0iS8sD4QAGur5
         8ndR1CTbByFG1xBZpjr1LP6Jfn3njXv6Iqk5kif97FQg5F9bgNafjLRapryjILQTN+3s
         FbejHvtCBsWi32xba65l5VDrYON75wGlRiRcZ43Zy/pt9Atpq3BXjSDVp8PGlUMYkCgf
         Vg1mzyqTdZ16VVASM0SV8pUlgFHm3hyzOMd8ESW2kilZZssEb0u+xqxKLXPR5PnO8xpX
         0sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KRuxjqTYbnBKXKobdi0fccXY7HVuk0DaVGKwwr2eM3Q=;
        b=HJ/S/cRylSe8N1BS8QcLuWd5RdbLf7ttzCDkHsSkr5O8yyvKaDoQuLtiokUD+rokme
         gQR/g0gmC58bdh7ZFVARa/GYbafnL0N9dvoVL0wbjkHmto69/50ms8o8jU42CgtMGNvw
         t1NZzFYjzgp7MW49NqblH+nRbPXn5BcYCfOrzMgVGYr1sWfyI3QoczSy+PPfjdFnogq7
         GfOorOejZ9LZRnVINcbwXelyAAacvGE3MtBDJBkUjjkPFdE3/ZMJ4RnSaOvFIZr76tFf
         I1vgZulTv4iWwyRdhkp2SIFrKLrRWPSlb/GolN4Ys0pBdDh3UP2uMDSUzYbM9dNLvaFn
         tAEA==
X-Gm-Message-State: APjAAAVCSYKSGikj5PqIR8l0q++WBmJlqM9qdCnXzDD7BnW3kF/BHnKO
        PWi4YN6ZKV2v6AQxa62PZ1nRrOL7OwmjjigDZhTA2w==
X-Google-Smtp-Source: APXvYqwhmgelIp2y7QC1Y22OWhCkVPJU8EPmwl0EBwhBigoPAiYYY1Q3kPkZ7TqbQUBEmWQ6a8FQia3DxqHKiVF7rM4=
X-Received: by 2002:a6b:cdcc:: with SMTP id d195mr6539501iog.78.1565883709544;
 Thu, 15 Aug 2019 08:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com>
In-Reply-To: <20190801012823.28730-1-neolynx@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 15 Aug 2019 10:41:38 -0500
Message-ID: <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jul 31, 2019 at 8:42 PM Andr=C3=A9 Roth <neolynx@gmail.com> wrote:
>
> Hi all,
>
> the current mainline kernel does not provide support for running
> omap36xx based boards at 1GHz for chips like DM3730 where this would be
> supported. It has been discussed many times, I hope you do not mind me
> bringing this up again ;)
>
> I found some proposed patches by Nishanth Menon from TI [1] and a
> statement [2] that drivers for the Voltage processor and controllers are
> needed to properly run those chips at 1GHz using Adaptive Voltage
> Scaling (AVS) and SmartReflex (SR).
>
> As there are drivers for VP and VC in the kernel, I tried to figure out
> how to enable them and found a PATCH 1/3 which enables SR in the TWL
> driver. However, the order in which PM, SR and TWL are initialized or
> probed did not match, which I was able to fix with PATCH 2/3. In the end
> calling omap_sr_enable in PATCH 3/3 finally enables SR and my board
> seems to run fine at 1GHz (not battery powered, full performance
> required).
>

Question:

Not all 36xx SoC's can do 1GHz.  I know there is a register that we
can read on the OMAP36 to determine its max speed, but I wasn't sure
how that would play into cpufreq or whatever is going to be driving
the dynamic voltage and frequency scaling.  Are going to have to
expect people who have the 1GHz version to use a custom device tree?
AFAICT, there is an updated opp-v2-ti table which has a 'supported'
entry which appears to read registers to determine which opp's are
available for the am33xx, but I don't think this applies to the
omap36.  Do we need something that like for this?

adam

> Looking at a register dump on DM3730, I can see that VP, VC1 and SR1 are
> enabled:
>
> Global PRM_VC_SMPS_SA     [0x48307220]: 0x00120012  000000000001001000000=
00000010010
> Global PRM_VC_SMPS_VOL_RA [0x48307224]: 0x00010000  000000000000000100000=
00000000000
> Global PRM_VC_SMPS_CMD_RA [0x48307228]: 0x00000000  000000000000000000000=
00000000000
> Global PRM_VC_CMD_VAL_0   [0x4830722C]: 0x3E201E00  001111100010000000011=
11000000000
> Global PRM_VC_CMD_VAL_1   [0x48307230]: 0x30201E00  001100000010000000011=
11000000000
> Global PRM_VC_CH_CONF     [0x48307234]: 0x00130008  000000000001001100000=
00000001000
> Global PRM_VC_I2C_CFG     [0x48307238]: 0x00000008  000000000000000000000=
00000001000
> Global PRM_VC_BYPASS_VAL  [0x4830723C]: 0x00000000  000000000000000000000=
00000000000
> Global PRM_RSTCTRL        [0x48307250]: 0x00000000  000000000000000000000=
00000000000
> Global PRM_RSTTIME        [0x48307254]: 0x00001006  000000000000000000010=
00000000110
> Global PRM_RSTST          [0x48307258]: 0x00000001  000000000000000000000=
00000000001
> Global PRM_VOLTCTRL       [0x48307260]: 0x0000000A  000000000000000000000=
00000001010
> Global PRM_SRAM_PCHARGE   [0x48307264]: 0x00000050  000000000000000000000=
00001010000
> Global PRM_CLKSRC_CTRL    [0x48307270]: 0x00000088  000000000000000000000=
00010001000
> Global PRM_OBS            [0x48307280]: 0x00000000  000000000000000000000=
00000000000
> Global PRM_VOLTSETUP1     [0x48307290]: 0x00700070  000000000111000000000=
00001110000
> Global PRM_VOLTOFFSET     [0x48307294]: 0x00000010  000000000000000000000=
00000010000
> Global PRM_CLKSETUP       [0x48307298]: 0x00000148  000000000000000000000=
00101001000
> Global PRM_POLCTRL        [0x4830729C]: 0x00000002  000000000000000000000=
00000000010
> Global PRM_VOLTSETUP2     [0x483072A0]: 0x00000000  000000000000000000000=
00000000000
> Global PRM_VP1_CONFIG     [0x483072B0]: 0x00273E09  000000000010011100111=
11000001001
> Global PRM_VP1_VSTEPMIN   [0x483072B4]: 0x00002901  000000000000000000101=
00100000001
> Global PRM_VP1_VSTEPMAX   [0x483072B8]: 0x00002904  000000000000000000101=
00100000100
> Global PRM_VP1_VLIMITTO   [0x483072BC]: 0x42140A28  010000100001010000001=
01000101000
> Global PRM_VP1_VOLTAGE    [0x483072C0]: 0x00000034  000000000000000000000=
00000110100
> Global PRM_VP1_STATUS     [0x483072C4]: 0x00000001  000000000000000000000=
00000000001
> Global PRM_VP2_CONFIG     [0x483072D0]: 0x00000008  000000000000000000000=
00000001000
> Global PRM_VP2_VSTEPMIN   [0x483072D4]: 0x00002901  000000000000000000101=
00100000001
> Global PRM_VP2_VSTEPMAX   [0x483072D8]: 0x00002904  000000000000000000101=
00100000100
> Global PRM_VP2_VLIMITTO   [0x483072DC]: 0x2C180A28  001011000001100000001=
01000101000
> Global PRM_VP2_VOLTAGE    [0x483072E0]: 0x00000000  000000000000000000000=
00000000000
> Global PRM_VP2_STATUS     [0x483072E4]: 0x00000001  000000000000000000000=
00000000001
> Global PRM_LDO_ABB_SETUP  [0x483072F0]: 0x00000000  000000000000000000000=
00000000000
> Global PRM_LDO_ABB_CTRL   [0x483072F4]: 0x00003201  000000000000000000110=
01000000001
> PRCM   SRCONFIG           [0x480C9000]: 0x00041E03  000000000000010000011=
11000000011
> PRCM   SRSTATUS           [0x480C9004]: 0x0000000A  000000000000000000000=
00000001010
> PRCM   SENVAL             [0x480C9008]: 0x064A0715  000001100100101000000=
11100010101
> PRCM   SENMIN             [0x480C900C]: 0xFFFFFFFF  111111111111111111111=
11111111111
> PRCM   SENMAX             [0x480C9010]: 0x00000000  000000000000000000000=
00000000000
> PRCM   SENAVG             [0x480C9014]: 0x00000000  000000000000000000000=
00000000000
> PRCM   AVGWEIGHT          [0x480C9018]: 0x00000000  000000000000000000000=
00000000000
> PRCM   NVALUERECIPROCAL   [0x480C901C]: 0x00AAA699  000000001010101010100=
11010011001
> PRCM   IRQSTATUS_RAW      [0x480C9024]: 0x00000006  000000000000000000000=
00000000110
> PRCM   IRQSTATUS          [0x480C9028]: 0x00000000  000000000000000000000=
00000000000
> PRCM   IRQENABLE_SET      [0x480C902C]: 0x00000000  000000000000000000000=
00000000000
> PRCM   IRQENABLE_CLR      [0x480C9030]: 0x00000000  000000000000000000000=
00000000000
> PRCM   SENERROR_REG       [0x480C9034]: 0x0000FDFD  000000000000000011111=
10111111101
> PRCM   ERRCONFIG          [0x480C9038]: 0x064402FA  000001100100010000000=
01011111010
>
> @Nishanth: could you confirm that DM3730 (1GHz version) is properly
> configured for running at 1GHz ? (I know this is a tricky question and
> has been asked before...)
>
> As this is just a hack, I would like to know how to properly
> initialize those driver in the right order, preferably via device tree
> or kernel config instead of a board file.
>
> Also, SR2 (vcore) is not enabled, as no OPPs are defined in the device
> tree. I assume it would require 1.2V at 200MHz but could not find any
> reference to that.
>
>
> [1] https://marc.info/?l=3Dlinux-kernel&m=3D137185002523884&w=3D2
> [2] https://patchwork.kernel.org/patch/9526883/#20026873
> [3] https://marc.info/?l=3Dlinux-omap&m=3D129584746102725&w=3D2
>
> [PATCH 1/3] OMAP3: PM: Set/clear T2 bit for Smartreflex on TWL
> [PATCH 2/3] OMAP: Initialize PM and SmartReflex after TWL probe
> [PATCH 3/3] OMAP3: Enable SmartReflex on om36xx
>
>
