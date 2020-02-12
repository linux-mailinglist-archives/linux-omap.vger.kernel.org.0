Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A84159E18
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgBLAkO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:14 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33320 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgBLAkO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:14 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so292185lji.0
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oW56caOZX+W0a5qTNTmAm553uHnVZ0sojrhATf/BGUU=;
        b=Vc8R4rHavMgjLfDyWIJA7RfNKrMHSTOfKVb/Bhz42z8IlQuiuT2Xfrep+KiPCpBCJA
         I5WqwFEaLPuKWnuIKegz8QPiA9hJFK1G3BvqCp2cpVc5rMbUZTGOCJuilepKryfecepH
         nm4xVfPKlBabOGjxOxc+EEKY8H7qwU8mwW7+kyrjOQMzfW9CiABr2wlEqRWqpYGmQWtU
         h8/uWbMCuRwJC2qjZkHhS8Q1/kmzxNNEsInfICF2Cero3pcNhrv9PEyHzQyInuLOKc5x
         G5JdNvW00MCJiUC4n0uOzLFu8KKwAy1MeGoCQ15ccr3q+DpxNnKSKPEBT26htcHIT56y
         iLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oW56caOZX+W0a5qTNTmAm553uHnVZ0sojrhATf/BGUU=;
        b=oxFhA6VznN8qNuwja99KjV38I1V1eG2sbNfq8jCUN3581SUNCi/31bpw6RTLSvgd22
         MQTYa6qSk0Ek5S5we5yATCWfNSrM7GeRrI31bIf0LMt2GOdbdqyWWfoJWyNY7mDEcave
         znQd8xFqAh9vyfr2s7SZGCcWt5Zy/RbvC6eJ0fje+YaVk1V4ZskkmmyjyWvw3eEGuCdu
         x266egJZydk98lwT1u8l0XEBPJa1pfd/rJ8RXHhwnSC0AVqQIXJhlSFBqs7e0q3mmkl7
         SSoBO4xdO1P9CB+L+rgScOethieCBnth3Zrq9PHhONTBerAfaFocqFEUt86pv+TEtS1t
         KdKg==
X-Gm-Message-State: APjAAAUATKBpNxMYkaUXLTlKEIzE48Ycol5XhllM6BTIrjj/eJMvDXM1
        cm/w1XA9vZWnw2owZ2omZPVOtayL
X-Google-Smtp-Source: APXvYqxhJRYGRxonbi1AgPvSRlgGXbvyTq5eNoX/sZxb7DF1nypyaKRr5DfNACs2Uq9VcgzJ5m8QHg==
X-Received: by 2002:a2e:981a:: with SMTP id a26mr6136584ljj.82.1581468012219;
        Tue, 11 Feb 2020 16:40:12 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:11 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 00/14] mtd: rawnand: ams-delta: Prepare for merging
Date:   Wed, 12 Feb 2020 01:39:15 +0100
Message-Id: <20200212003929.6682-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In preparation for merging the driver with "gpio-nand", as suggested by
Boris Brezillon and others, drop Amstrad Delta specific bits or replace
them with more generic ones.

The series starts with v2 of a patch that adds write protection on boot,
originally submitted as a part of the driver GPIO migratiton series but
not merged, with comments received at that time from Boris Brezillon now
hopefully addressed.

The series also contains v4 of a previously discussed patch that drops
Amstrad Delta specific partition table info from the driver, now
provided by the board file via platform data, with an OF fix added in v2
now excluded to a separate patch.

Remaining patches are new submissions.

Janusz Krzysztofik (14):
  mtd: rawnand: ams-delta: Write protect device during probe
  mtd: rawnand: ams-delta: Use struct gpio_nand_platdata
  ARM: OMAP1: ams-delta: Provide board specific partition info
  mtd: rawnand: ams-delta: Drop board specific partition info
  mtd: rawnand: ams-delta: Enable OF partition info support
  mtd: rawnand: ams-delta: Push inversion handling to gpiolib
  mtd: rawnand: ams-delta: Don't hardcode read/write pulse widths
  mtd: rawnand: ams-delta: Make read pulses optional
  mtd: rawnand: ams-delta: Handle more GPIO pins as optional
  mtd: rawnand: ams-delta: Add module device tables
  mtd: rawnand: ams-delta: Support custom driver initialisation
  mtd: rawnand: ams-delta: Drop useless local variable
  mtd: rawnand: ams-delta: Make the driver custom I/O ready
  mtd: rawnand: ams-delta: Rename structures and functions to gpio_nand*

 arch/arm/mach-omap1/board-ams-delta.c |  47 ++++-
 drivers/mtd/nand/raw/ams-delta.c      | 237 +++++++++++++++++---------
 2 files changed, 198 insertions(+), 86 deletions(-)

-- 
2.24.1

