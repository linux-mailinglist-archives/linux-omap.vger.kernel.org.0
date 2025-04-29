Return-Path: <linux-omap+bounces-3623-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2DAAA0D5C
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 15:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8A117E969
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 13:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4559C2C179F;
	Tue, 29 Apr 2025 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zC8R43wB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC03442C;
	Tue, 29 Apr 2025 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932884; cv=none; b=fBVg4J0kOL6Der0W8TNSUQNUm4CJas4GY0B7o4kdYHHTQ7DeMd66YtF0x6FYgLCIJ2LF+v3M7bfKzRYjx5H0UjRJfzgyEbISX0tiOadop003qdBmxlGffd0NZ65j6v8TFOgfbal6Wz0vx5wUySdy7wavOu/dMu/LVcGSA/wIGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932884; c=relaxed/simple;
	bh=d21lQPCJlKmYy2McVqa/OcsM4B+w+QWisKWqIFHAW7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHPQdPAEfsKBnv/9GrMTyHV9By1zldFcYEkcFK+DROQPb0bbyvSYFl0Rg7gFAcyh+CXoR0Aii6dfuyG8QAp2bM/o/6IIZt/HKuWBgRvoMuT9hQTfCCe2W7bT6cOqI78J2pn00gGpv9LXzgnOPfJaZivC0lqTiTDeOG8yiMUyyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zC8R43wB; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1E1AA1F9D4;
	Tue, 29 Apr 2025 15:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745932880;
	bh=QQ/EQc8WvbyIZPOpA4lkCX/kb4dojAY/N219rBVNE14=;
	h=Received:From:To:Subject;
	b=zC8R43wBUP7wutGFTJMfh1wvS6igFi2q7v3bslVZyjhQi02aCb7j7OzrRTtQDE1KV
	 yz0Baxx4FjNUyqusL4d/Fl4+ETQ91aCUDJbw9t8Ykp5keBSE7MAH3BCFvu68IeC/jA
	 53B5kUNjA2ZTAV6FJ4UW2CIvtHbfkBwIJh0knoqlshvLGbKS58JbhDk3zKTrR/5SbC
	 Wzf2k4/1z6pxkPxioNKvRPbF2o3Y1rjllYjjuLH6TPjZPZdZKi4NfOlz1i2oawz/bb
	 +CGp+XbTrCcV2My0qEA08Dsc8nf00Zd5A8Zf4fcCB9qaNYlKpPWh7mRxlbH+rWl6ka
	 4p/EFhea5bwYw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id CDDA87F820; Tue, 29 Apr 2025 15:21:19 +0200 (CEST)
Date: Tue, 29 Apr 2025 15:21:19 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Jerome Neanne <jneanne@baylibre.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: tps65219/am62p kernel oops
Message-ID: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,
while working on adding support in mainline for a new board based on TI
AM62P SoC I noticed the following Kernel Oops.

This oops was reproduced running current Linux
master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
to reproduce the same with 6.14.4.

[  +0.010478] Unable to handle kernel NULL pointer dereference at virtual address 00000000000003b0
[  +0.000038] Mem abort info:
[  +0.000010]   ESR = 0x0000000096000005
[  +0.000010]   EC = 0x25: DABT (current EL), IL = 32 bits
[  +0.000013]   SET = 0, FnV = 0
[  +0.000009]   EA = 0, S1PTW = 0
[  +0.000010]   FSC = 0x05: level 1 translation fault
[  +0.000012] Data abort info:
[  +0.000009]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[  +0.000012]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  +0.000012]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  +0.000012] [00000000000003b0] user address but active_mm is swapper
[  +0.000014] Internal error: Oops: 0000000096000005 [#1]  SMP
[  +0.000014] Modules linked in:
[  +0.000018] CPU: 0 UID: 0 PID: 60 Comm: irq/26-tps65219 Not tainted 6.15.0-rc4+ #1 PREEMPT
[  +0.000020] Hardware name: Toradex Verdin AM62P WB on Verdin Development Board (DT)
[  +0.000016] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  +0.000016] pc : regulator_notifier_call_chain+0x20/0xa4
[  +0.000024] lr : tps65219_regulator_irq_handler+0x34/0x80
[  +0.000017] sp : ffffffc08220bc60
[  +0.000010] x29: ffffffc08220bc60 x28: ffffffc0800ac308 x27: ffffff80019b1180
[  +0.000023] x26: 0000000000000008 x25: ffffff8003684c00 x24: 0000000000000001
[  +0.000022] x23: ffffff8003684adc x22: 0000000000000024 x21: 0000000000000000
[  +0.000022] x20: 0000000000000000 x19: 0000000000008000 x18: 00000000ffffffff
[  +0.000022] x17: ffffff800103ff80 x16: ffffff800103ff00 x15: ffffffc08199b860
[  +0.000022] x14: 0000000000000151 x13: 0000000000000158 x12: 0000000000000001
[  +0.000022] x11: 0000000000000001 x10: 0000000000000980 x9 : 1ffffff0006e1f01
[  +0.000022] x8 : 0000000000000001 x7 : ffffff800370f800 x6 : ffffff800370f808
[  +0.000022] x5 : 0000000000000039 x4 : ffffffbffeaf0000 x3 : 0000000000000001
[  +0.000021] x2 : 0000000000000000 x1 : 0000000000008000 x0 : 0000000000000000
[  +0.000022] Call trace:
[  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
[  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
[  +0.000017]  handle_nested_irq+0xb8/0x138
[  +0.000018]  regmap_irq_thread+0x2d4/0x718
[  +0.000019]  irq_thread_fn+0x2c/0xa8
[  +0.000014]  irq_thread+0x17c/0x284
[  +0.000015]  kthread+0x12c/0x1ec
[  +0.000018]  ret_from_fork+0x10/0x20
[  +0.000022] Code: aa0103f3 aa0003f4 f90013f5 aa0203f5 (f941d801)
[  +0.000016] ---[ end trace 0000000000000000 ]---
[  +0.000026] genirq: exiting task "irq/26-tps65219" (60) is an active IRQ thread (irq 26)


I cannot tell if this is a regression or not, but what I know is that
the same board, with the same DT, does not have such an error with
6.6 TI kernel branch.

With TI 6.6 kernel, using the power button, that is connected to the PMIC, I
see from /proc/interrupts that the count of tps65219_irq increases accordingly
to the amount of time I press the button, so my assumption is that the
interrupt configuration in the DT is correct.

I'd like also to mention that we use the same PMIC, connected in a very similar
way, on a TI AM625 based system, and the issue there is not present.

As I wrote the DT that is triggering this error is not in mainline, yet,
however here a small snippet for reference, hopefully I'll send it to
the LKML in a few days.

	pmic@30 {
		compatible = "ti,tps65219";
		reg = <0x30>;
		pinctrl-names = "default";
		pinctrl-0 = <&pinctrl_pmic_extint>;
		interrupt-parent = <&gic500>;
		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;

		buck1-supply = <&reg_vsodimm>;
		buck2-supply = <&reg_vsodimm>;
		buck3-supply = <&reg_vsodimm>;
		ldo1-supply = <&reg_3v3>;
		ldo2-supply = <&reg_1v8>;
		ldo3-supply = <&reg_3v3>;
		ldo4-supply = <&reg_3v3>;
		system-power-controller;
		ti,power-button;

		regulators {
	...

	pinctrl_pmic_extint: main-system-extint-default-pins {
		pinctrl-single,pins = <
			AM62X_IOPAD(0x01f4, PIN_INPUT, 0) /* (D16) EXTINTn */
		>;
	};

	...

# cat /proc/interrupts 
           CPU0       CPU1       CPU2       CPU3       
 11:       2023       2474       2352       2095    GICv3  30 Level     arch_timer
 14:          0          0          0          0    GICv3  23 Level     arm-pmu
 15:       2327          0          0          0    GICv3  66 Level     4d000000.mailbox thr_012
 24:          0          0          0          0    GICv3 139 Level     4900000.i2c
 25:        204          0          0          0    GICv3 197 Level     2b200000.i2c
 26:          0          0          0          0    GICv3 256 Level     tps65219_irq
 27:          0          0          0          0 tps65219_irq   0 Edge      LDO3_SCG
 28:          0          0          0          0 tps65219_irq   1 Edge      LDO3_OC
 29:          0          0          0          0 tps65219_irq   2 Edge      LDO3_UV
 30:          0          0          0          0 tps65219_irq   3 Edge      LDO4_SCG
 31:          0          0          0          0 tps65219_irq   4 Edge      LDO4_OC
 32:          0          0          0          0 tps65219_irq   5 Edge      LDO4_UV
 33:          0          0          0          0 tps65219_irq  12 Edge      LDO1_SCG
 34:          0          0          0          0 tps65219_irq  13 Edge      LDO1_OC
 35:          0          0          0          0 tps65219_irq  14 Edge      LDO1_UV
 36:          0          0          0          0 tps65219_irq  15 Edge      LDO2_SCG
 37:          0          0          0          0 tps65219_irq  16 Edge      LDO2_OC
 38:          0          0          0          0 tps65219_irq  17 Edge      LDO2_UV
 39:          0          0          0          0 tps65219_irq  18 Edge      BUCK3_SCG
 40:          0          0          0          0 tps65219_irq  19 Edge      BUCK3_OC
 41:          0          0          0          0 tps65219_irq  20 Edge      BUCK3_NEG_OC
 42:          0          0          0          0 tps65219_irq  21 Edge      BUCK3_UV
 43:          0          0          0          0 tps65219_irq  22 Edge      BUCK1_SCG
 44:          0          0          0          0 tps65219_irq  23 Edge      BUCK1_OC
 45:          0          0          0          0 tps65219_irq  24 Edge      BUCK1_NEG_OC
 46:          0          0          0          0 tps65219_irq  25 Edge      BUCK1_UV
 47:          0          0          0          0 tps65219_irq  26 Edge      BUCK2_SCG
 48:          0          0          0          0 tps65219_irq  27 Edge      BUCK2_OC
 49:          0          0          0          0 tps65219_irq  28 Edge      BUCK2_NEG_OC
 50:          0          0          0          0 tps65219_irq  29 Edge      BUCK2_UV
 51:          0          0          0          0 tps65219_irq  38 Edge      BUCK1_RV
 52:          0          0          0          0 tps65219_irq  39 Edge      BUCK2_RV
 53:          0          0          0          0 tps65219_irq  40 Edge      BUCK3_RV
 54:          0          0          0          0 tps65219_irq  41 Edge      LDO1_RV
 55:          0          0          0          0 tps65219_irq  42 Edge      LDO2_RV
 56:          0          0          0          0 tps65219_irq  45 Edge      LDO3_RV
 57:          0          0          0          0 tps65219_irq  46 Edge      LDO4_RV
 58:          0          0          0          0 tps65219_irq  47 Edge      BUCK1_RV_SD
 59:          0          0          0          0 tps65219_irq  48 Edge      BUCK2_RV_SD
 60:          0          0          0          0 tps65219_irq  49 Edge      BUCK3_RV_SD
 61:          0          0          0          0 tps65219_irq  50 Edge      LDO1_RV_SD
 62:          0          0          0          0 tps65219_irq  53 Edge      LDO2_RV_SD
 63:          0          0          0          0 tps65219_irq  54 Edge      LDO3_RV_SD
 64:          0          0          0          0 tps65219_irq  55 Edge      LDO4_RV_SD
 65:          0          0          0          0 tps65219_irq  56 Edge      TIMEOUT
 66:          0          0          0          0 tps65219_irq  30 Edge      SENSOR_3_WARM
 67:          0          0          0          0 tps65219_irq  31 Edge      SENSOR_2_WARM
 68:          0          0          0          0 tps65219_irq  32 Edge      SENSOR_1_WARM
 69:          0          0          0          0 tps65219_irq  33 Edge      SENSOR_0_WARM
 70:          0          0          0          0 tps65219_irq  34 Edge      SENSOR_3_HOT
 71:          0          0          0          0 tps65219_irq  35 Edge      SENSOR_2_HOT
 72:          0          0          0          0 tps65219_irq  36 Edge      SENSOR_1_HOT
 73:          0          0          0          0 tps65219_irq  37 Edge      SENSOR_0_HOT
 74:          0          0          0          0 tps65219_irq  57 Edge      tps65219-pwrbutton.2.auto
 75:          0          0          0          0 tps65219_irq  58 Edge      tps65219-pwrbutton.2.auto
 76:         85          0          0          0    GICv3 193 Level     20000000.i2c
 77:          0          0          0          0    GICv3 194 Level     20010000.i2c
 78:          0          0          0          0    GICv3 196 Level     20030000.i2c
 79:          0          0          0          0 MSI-INTA 1713156 Level     485c0100.dma-controller chan2
 97:          0          0          0          0 MSI-INTA 1714176 Edge      485c0100.dma-controller chan0
109:          0          0          0          0 MSI-INTA 1714688 Level     485c0100.dma-controller chan0
121:          0          0          0          0 MSI-INTA 1715712 Edge      485c0100.dma-controller chan1
139:          0          0          0          0 MSI-INTA 1716224 Level     485c0100.dma-controller chan1
167:         10          0          0          0 MSI-INTA 1970707 Level     8000000.ethernet-tx0
175:          3          0          0          0 MSI-INTA 1970715 Level     8000000.ethernet-tx1
183:          2          0          0          0 MSI-INTA 1970723 Level     8000000.ethernet-tx2
191:          0          0          0          0 MSI-INTA 1970731 Level     8000000.ethernet-tx3
199:          0          0          0          0 MSI-INTA 1970739 Level     8000000.ethernet-tx4
207:          2          0          0          0 MSI-INTA 1970747 Level     8000000.ethernet-tx5
215:          2          0          0          0 MSI-INTA 1970755 Level     8000000.ethernet-tx6
223:          0          0          0          0 MSI-INTA 1970763 Level     8000000.ethernet-tx7
239:          0          0          0          0 MSI-INTA 1970779 Level     485c0000.dma-controller chan2
257:          1          0          0          0 MSI-INTA 1971731 Level     8000000.ethernet-rx0
281:          0          0          0          0 MSI-INTA 1971755 Level     485c0000.dma-controller chan0
282:          0          0          0          0 MSI-INTA 1971756 Level     485c0000.dma-controller chan1
301:          0          0          0          0    GICv3 217 Level     4a00000.serial
302:        496          0          0          0    GICv3 210 Level     2800000.serial
303:          0          0          0          0    GICv3 211 Level     2810000.serial
304:       7674          0          0          0    GICv3 216 Level     2860000.serial
305:          0          0          0          0    GICv3 134 Level     8000000.ethernet
307:       2188          0          0          0    GICv3 165 Level     mmc0
308:        187          0          0          0    GICv3 114 Level     mmc2
342:          0          0          0          0     GPIO   1 Edge    -davinci_gpio  Wake-Up
372:          0          0          0          0     GPIO  31 Edge    -davinci_gpio  connector
377:          2          0          0          0     GPIO  36 Edge    -davinci_gpio  8000f00.mdio:00
383:          0          0          0          0     GPIO  42 Edge    -davinci_gpio  8000f00.mdio:07
485:          0          0          0          0     GPIO  48 Edge    -davinci_gpio  fa00000.mmc cd
489:          0          0          0          0    GICv3 115 Level     mmc1
490:          0          0          0          0    GICv3 204 Level     20100000.spi
495:          0          0          0          0    GICv3 267 Level     2b00000.audio-controller_rx
496:          0          0          0          0    GICv3 268 Level     2b00000.audio-controller_tx
497:          0          0          0          0    GICv3 218 Level     2b300000.serial
498:          0          0          0          0    GICv3 205 Level     20110000.spi
499:          0          0          0          0    GICv3 132 Level     2b1f0000.rtc
500:          0          0          0          0    GICv3 171 Level     fc40000.spi
501:        162          0          0          0    GICv3 220 Level     dwc3
502:        112          0          0          0    GICv3 258 Level     xhci-hcd:usb1
IPI0:       511        587        632        420       Rescheduling interrupts
IPI1:      1920       3344       2395       1843       Function call interrupts
IPI2:         0          0          0          0       CPU stop interrupts
IPI3:         0          0          0          0       CPU stop NMIs
IPI4:         0          0          0          0       Timer broadcast interrupts
IPI5:        79         99         62         47       IRQ work interrupts
IPI6:         0          0          0          0       CPU backtrace interrupts
IPI7:         0          0          0          0       KGDB roundup interrupts
Err:          0


Any suggestion?

Francesco


