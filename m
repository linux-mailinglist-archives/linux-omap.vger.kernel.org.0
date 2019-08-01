Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF0607D2D4
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 03:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfHAB2h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Jul 2019 21:28:37 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37640 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfHAB2h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Jul 2019 21:28:37 -0400
Received: by mail-qt1-f196.google.com with SMTP id y26so68571583qto.4
        for <linux-omap@vger.kernel.org>; Wed, 31 Jul 2019 18:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmpHUutSyWgxNu2ZA15TTUnHQ/0LHm6e64ko4evaYEk=;
        b=Eh4AyoyDBI+5V+pNdyvE4NkTwqA5ns5qq2zbckvy8LbyqnAf+Ie15nHPui30/o0T/Q
         HiD4mv88CVLi48QltiB+WpAn2dOLMeT5tqul1RFnf0MXRW9DPWUFkXdNp7jjoTsNhVT9
         7wI7uPTpwF/wejQ3/Qn70J2FvdJIlkTtbWdOmNsNW83xPSAngokn6C2tB2jJdQR37F8z
         WVQdDttIeVp72tYHCQvWQ/APhqEaM0aWu+bByw7uDcyXF5n0Z1RD1TJdgyGvxojS0zJm
         jxgEuv+3w+IRLb6VIUit7yfWMF95yrxdOCoEiYAdsfWtQfcHBHZXMSMacUermqrZGVfJ
         gfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmpHUutSyWgxNu2ZA15TTUnHQ/0LHm6e64ko4evaYEk=;
        b=eTrtWjPbiaFeAiHGMYVjhLP7pJkR1YOhIhqb9nfk4eNf8T9iCpbrvBBYbA9swwYhPU
         6EJ0upBGaNxVae0cfu+juFxR4FkGFlgozIjkwsSI2KPI/0vzOmnJAF7N5Ktqd8CjO/8X
         wu9rNQvKbn40P05NoWewalkJH6SdF7hhbHQbyLfep+DW4QyTa4zcGyFNyDiL7JOpBv/x
         WyJFndF9Y6XAKt9t7K9AXRFyiD4FCoRs5RjgkKFjsyqY1IfEJde9lbCBnjA+rL36VRNg
         0XAYfU5atgTq8lCRnANEZP5Bl0+zk/6AO5ccns2CBWBhjChMydIr+462r4M0pgiOVt/8
         cQtw==
X-Gm-Message-State: APjAAAXziq8hU632lSS63tcVZYFWqPwrjVhsuzko/01v6rgNoS2z0nI5
        tCv6ijk/S5LPBnD9gQeLhO6bpKXSZlCmlA==
X-Google-Smtp-Source: APXvYqz3OS2LnDxhKwTTpghovPvhNAXNCv6UNSPCUY7AIubAt6DTfDe8gPwPjuWRnOt3E4mmurigvw==
X-Received: by 2002:a0c:b0a8:: with SMTP id o37mr90550170qvc.76.1564622915881;
        Wed, 31 Jul 2019 18:28:35 -0700 (PDT)
Received: from lepton.domain.name ([191.243.232.18])
        by smtp.gmail.com with ESMTPSA id x205sm32130536qka.56.2019.07.31.18.28.33
        for <linux-omap@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 18:28:35 -0700 (PDT)
From:   =?UTF-8?q?Andr=C3=A9=20Roth?= <neolynx@gmail.com>
To:     linux-omap@vger.kernel.org
Subject: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
Date:   Thu,  1 Aug 2019 03:28:20 +0200
Message-Id: <20190801012823.28730-1-neolynx@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

the current mainline kernel does not provide support for running
omap36xx based boards at 1GHz for chips like DM3730 where this would be
supported. It has been discussed many times, I hope you do not mind me
bringing this up again ;)

I found some proposed patches by Nishanth Menon from TI [1] and a
statement [2] that drivers for the Voltage processor and controllers are
needed to properly run those chips at 1GHz using Adaptive Voltage
Scaling (AVS) and SmartReflex (SR).

As there are drivers for VP and VC in the kernel, I tried to figure out
how to enable them and found a PATCH 1/3 which enables SR in the TWL
driver. However, the order in which PM, SR and TWL are initialized or
probed did not match, which I was able to fix with PATCH 2/3. In the end
calling omap_sr_enable in PATCH 3/3 finally enables SR and my board
seems to run fine at 1GHz (not battery powered, full performance
required).

Looking at a register dump on DM3730, I can see that VP, VC1 and SR1 are
enabled:

Global PRM_VC_SMPS_SA     [0x48307220]: 0x00120012  00000000000100100000000000010010
Global PRM_VC_SMPS_VOL_RA [0x48307224]: 0x00010000  00000000000000010000000000000000
Global PRM_VC_SMPS_CMD_RA [0x48307228]: 0x00000000  00000000000000000000000000000000
Global PRM_VC_CMD_VAL_0   [0x4830722C]: 0x3E201E00  00111110001000000001111000000000
Global PRM_VC_CMD_VAL_1   [0x48307230]: 0x30201E00  00110000001000000001111000000000
Global PRM_VC_CH_CONF     [0x48307234]: 0x00130008  00000000000100110000000000001000
Global PRM_VC_I2C_CFG     [0x48307238]: 0x00000008  00000000000000000000000000001000
Global PRM_VC_BYPASS_VAL  [0x4830723C]: 0x00000000  00000000000000000000000000000000
Global PRM_RSTCTRL        [0x48307250]: 0x00000000  00000000000000000000000000000000
Global PRM_RSTTIME        [0x48307254]: 0x00001006  00000000000000000001000000000110
Global PRM_RSTST          [0x48307258]: 0x00000001  00000000000000000000000000000001
Global PRM_VOLTCTRL       [0x48307260]: 0x0000000A  00000000000000000000000000001010
Global PRM_SRAM_PCHARGE   [0x48307264]: 0x00000050  00000000000000000000000001010000
Global PRM_CLKSRC_CTRL    [0x48307270]: 0x00000088  00000000000000000000000010001000
Global PRM_OBS            [0x48307280]: 0x00000000  00000000000000000000000000000000
Global PRM_VOLTSETUP1     [0x48307290]: 0x00700070  00000000011100000000000001110000
Global PRM_VOLTOFFSET     [0x48307294]: 0x00000010  00000000000000000000000000010000
Global PRM_CLKSETUP       [0x48307298]: 0x00000148  00000000000000000000000101001000
Global PRM_POLCTRL        [0x4830729C]: 0x00000002  00000000000000000000000000000010
Global PRM_VOLTSETUP2     [0x483072A0]: 0x00000000  00000000000000000000000000000000
Global PRM_VP1_CONFIG     [0x483072B0]: 0x00273E09  00000000001001110011111000001001
Global PRM_VP1_VSTEPMIN   [0x483072B4]: 0x00002901  00000000000000000010100100000001
Global PRM_VP1_VSTEPMAX   [0x483072B8]: 0x00002904  00000000000000000010100100000100
Global PRM_VP1_VLIMITTO   [0x483072BC]: 0x42140A28  01000010000101000000101000101000
Global PRM_VP1_VOLTAGE    [0x483072C0]: 0x00000034  00000000000000000000000000110100
Global PRM_VP1_STATUS     [0x483072C4]: 0x00000001  00000000000000000000000000000001
Global PRM_VP2_CONFIG     [0x483072D0]: 0x00000008  00000000000000000000000000001000
Global PRM_VP2_VSTEPMIN   [0x483072D4]: 0x00002901  00000000000000000010100100000001
Global PRM_VP2_VSTEPMAX   [0x483072D8]: 0x00002904  00000000000000000010100100000100
Global PRM_VP2_VLIMITTO   [0x483072DC]: 0x2C180A28  00101100000110000000101000101000
Global PRM_VP2_VOLTAGE    [0x483072E0]: 0x00000000  00000000000000000000000000000000
Global PRM_VP2_STATUS     [0x483072E4]: 0x00000001  00000000000000000000000000000001
Global PRM_LDO_ABB_SETUP  [0x483072F0]: 0x00000000  00000000000000000000000000000000
Global PRM_LDO_ABB_CTRL   [0x483072F4]: 0x00003201  00000000000000000011001000000001
PRCM   SRCONFIG           [0x480C9000]: 0x00041E03  00000000000001000001111000000011
PRCM   SRSTATUS           [0x480C9004]: 0x0000000A  00000000000000000000000000001010
PRCM   SENVAL             [0x480C9008]: 0x064A0715  00000110010010100000011100010101
PRCM   SENMIN             [0x480C900C]: 0xFFFFFFFF  11111111111111111111111111111111
PRCM   SENMAX             [0x480C9010]: 0x00000000  00000000000000000000000000000000
PRCM   SENAVG             [0x480C9014]: 0x00000000  00000000000000000000000000000000
PRCM   AVGWEIGHT          [0x480C9018]: 0x00000000  00000000000000000000000000000000
PRCM   NVALUERECIPROCAL   [0x480C901C]: 0x00AAA699  00000000101010101010011010011001
PRCM   IRQSTATUS_RAW      [0x480C9024]: 0x00000006  00000000000000000000000000000110
PRCM   IRQSTATUS          [0x480C9028]: 0x00000000  00000000000000000000000000000000
PRCM   IRQENABLE_SET      [0x480C902C]: 0x00000000  00000000000000000000000000000000
PRCM   IRQENABLE_CLR      [0x480C9030]: 0x00000000  00000000000000000000000000000000
PRCM   SENERROR_REG       [0x480C9034]: 0x0000FDFD  00000000000000001111110111111101
PRCM   ERRCONFIG          [0x480C9038]: 0x064402FA  00000110010001000000001011111010

@Nishanth: could you confirm that DM3730 (1GHz version) is properly
configured for running at 1GHz ? (I know this is a tricky question and
has been asked before...)

As this is just a hack, I would like to know how to properly
initialize those driver in the right order, preferably via device tree
or kernel config instead of a board file.

Also, SR2 (vcore) is not enabled, as no OPPs are defined in the device
tree. I assume it would require 1.2V at 200MHz but could not find any
reference to that.


[1] https://marc.info/?l=linux-kernel&m=137185002523884&w=2
[2] https://patchwork.kernel.org/patch/9526883/#20026873
[3] https://marc.info/?l=linux-omap&m=129584746102725&w=2

[PATCH 1/3] OMAP3: PM: Set/clear T2 bit for Smartreflex on TWL
[PATCH 2/3] OMAP: Initialize PM and SmartReflex after TWL probe
[PATCH 3/3] OMAP3: Enable SmartReflex on om36xx


