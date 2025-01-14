Return-Path: <linux-omap+bounces-3118-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96091A11242
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 21:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4DBD188AE41
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 20:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D579120D51E;
	Tue, 14 Jan 2025 20:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b="Teqv9Aqn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tf2j1Nh0"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27051459FD;
	Tue, 14 Jan 2025 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887322; cv=none; b=PgcFn4sbymovRGJIeVEDVpiu9a/XYgQfmYnGu5X4POQNtyCIlUK/gO+1SuryEuZiSNCKKJBCRs3zktQhfikOUdlxo1sMhQZ1oZCthfvAl/lPeoIMl6ohV7JYHTcAaki9n2aepBCY7jqf6p5fLO6fz9z39EuQpu2nErBuQjoecV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887322; c=relaxed/simple;
	bh=cv3jA4lBt73juQxv0ekC6L4lkRU8HB1MI/gw7T+FRhc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OOZ2yso/gf/57N+e/U76xVGk/C1NfTNLnVr7/r9yUjCdgu2G/lBG0dBQEnZzTjpQ4SagwbA5PN+PPkoebGzPCeU5f/sQ7X49J6pvWV7stGrGaLsAqu3RHSKEeb1o3xQlnPXxKjwE6g0sywvX2GD4YBTIGrN7JlI4kbwDNADk9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name; spf=pass smtp.mailfrom=coelacanthus.name; dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b=Teqv9Aqn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tf2j1Nh0; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coelacanthus.name
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id EB5D911400D1;
	Tue, 14 Jan 2025 15:41:58 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jan 2025 15:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1736887318; x=1736973718; bh=x6wdS63I7iHxelb/E+SvOq6HbYS9Fkar
	ZVemmOHTtbY=; b=Teqv9AqnoHU2b/ZfHDmcu3QdSaoJxH8ugHPqnbyxIMBShcwv
	Lf2GEsXZukuS9aUclO3QhWHoKvIzbcij/syxWl/4aQI0ZhpNHWXobLO5hcW5ShK9
	rVBWetAzpiHUUjUJoJuYWIMiTL/WY3l7LkgmZiTge+glzhlm89d/ygR/afLsnG7u
	SZIkx818drjhQOczxXPZRNjaunM5awjv2mwbxXjwBZp1CKFSF19tv6oHQnPmFRnu
	g4kWaBM0wy4tq7jyIY29KeVOLG8JPH5Nbz99b10I8yYvmhF7D62o6orTByR1ScZS
	Tba54HlxHnD+bqVmKjgr+OYMELe8rlbc+aTwVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736887318; x=1736973718; bh=x6wdS63I7iHxelb/E+SvOq6HbYS9
	FkarZVemmOHTtbY=; b=tf2j1Nh0libscBgGxLeSHwVa4wSGqR3zyUOhelkXgYpn
	AM/zuLgmrSrQKhQ38X5yQz6/NXCTaKSFf/BuclcebU4us1a42zc4VSJ10ag2JF7r
	WK4YtF36eJyQH04oHPWkB4LfhhKOAjcYkEcjEzH9JT1iOszYi/b0/NeJOzDMZQKN
	EID4mYT2SW0ku4m6Lh/BwUGrjjiVI/wVFG7HR0aFaFcI4yLF83nTFooAAR+NO5yQ
	Gb7cX4mos/IHAOxzB13/ODi2QQdtsI5Fu5vYj3I4Gm39OIlXFxeXg6meYqJji4gB
	jPLwrgkICd/ju68HrS4i3QsyNIbniILAm3X+178SXg==
X-ME-Sender: <xms:E8yGZ_j7IlxLrfXjd34wKzUYtithnOt_MYecT_MfeaIN8unmzo8mGw>
    <xme:E8yGZ8A03Elwj1quJsVtJYfR5hfs2eGd9spsr6mQ-ThDUbt6u4ha53OL_ia3e4A_Q
    EeXdfl2WFx4ISUa8zk>
X-ME-Received: <xmr:E8yGZ_FNh2JRLuE24yEj99RqS_R_D3jlCBAeIeuGiksqaYVTBoV7_lO4HBEwFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeen
    ucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthhhush
    drnhgrmhgvqeenucggtffrrghtthgvrhhnpeefffevkeegffejheejfeefudehffdvleef
    gfelkeehgffgueejffektefhgeefvdenucffohhmrghinheprhgvughhrghtrdgtohhmpd
    hgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepuhifuhestghovghlrggtrghnthhhuhhsrd
    hnrghmvgdpnhgspghrtghpthhtohepfeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtph
    htthhopehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhrtghpthhtohepjhho
    nhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfh
    grihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehhvghinhhrihgt
    hhdrshgthhhutghhrghrughtsegtrghnohhnihgtrghlrdgtohhmpdhrtghpthhtohepth
    honhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehtrhgvughinhhgse
    hnvhhiughirgdrtghomhdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdho
    rhhg
X-ME-Proxy: <xmx:FMyGZ8QhsqC4rulaQQ1Aa6jDtki7bsIRyEly7GnmFj6CQ-R_rWz4IA>
    <xmx:FMyGZ8w8IstiWH5mJUgk1U5Us_CS5tr7yDg3mKW6kv7Y9UACQv1G4g>
    <xmx:FMyGZy7HKbVf8qSEvl6NERCLJ3Bssdr-SNDbRcGHhdOJ3l3ZsGr1nQ>
    <xmx:FMyGZxy0wqD_ZKbT-P7jdqFXDV_l1yDJHtzdX6nsQ-qsxCyoCU4yvw>
    <xmx:FsyGZ2n2BgBlb2k_ztDznT66FATWySyZ7bhJ-RRz7vOyUskQ5qYN7RJL>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:41:54 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Subject: [PATCH v4 0/4] defconfig: drop RT_GROUP_SCHED=y
Date: Wed, 15 Jan 2025 04:41:19 +0800
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/LhmcC/33OTWrDMBAF4KsErTtBksc/6arQTe8QSlCksSWIr
 TByRELw3Suni2TTbgYezPt4d5GIAyXxvrkLphxSiFMJ+LYR1ptpIAiuZKGlRtnoFvpwBQ7JZuD
 5MHC8nA/JenLgNEmFR8LOGVHqZ6by+6D33yX3HEeYPZN5gnUllVI7bLc1lovQwWekk7Fmmv0lf
 dH1YxhNOG1tHFfThzRHvj3WZr3Kv06nq7+HZQ0SCN3RkMa+JfVirsNy9YR2Sv4DVQXCrqG2ptp
 Q416hZVl+ALc/HAZNAQAA
X-Change-ID: 20240627-fix-riscv-rt_group_sched-d2e014be48da
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Celeste Liu <uwu@coelacanthus.name>, Xi Ruoyao <xry111@xry111.site>, 
 Stefan Wahren <wahrenst@gmx.net>, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2984; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=cv3jA4lBt73juQxv0ekC6L4lkRU8HB1MI/gw7T+FRhc=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYzrF3Z/pe2qQhcyZn/MCV2WlTgnZb9bI6XGWaqv
 NWMu1li9KSjlIVBjItBVkyRJa+E5SfnpbPdezu2d8HMYWUCGcLAxSkAE2mMYPhnf5ezRCRmNU9M
 8yb9HuNZh25tn7bKI/6ll/Gjnh18LKWmjAwHNHVXXoyo5D/R+kHNU/Jo6GH+5VxvjMNnC54TvJi
 4v5EdAFPWRmA=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[1]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

---
Changes in v4:
- Update Acked-by
- Link to v3: https://lore.kernel.org/r/20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com

Changes in v3:
- Remove Fixes: tag because of it's not suitable.
- Link to v2: https://lore.kernel.org/r/20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com

Changes in v2:
* Remove MIPS and PowerPC patch because of merged.
* Link to v1: https://lore.kernel.org/lkml/20240530111947.549474-8-CoelacanthusHex@gmail.com/T

Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)

--
2.45.1

---
Celeste Liu (4):
      riscv: defconfig: drop RT_GROUP_SCHED=y
      loongarch: defconfig: drop RT_GROUP_SCHED=y
      sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
      arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)
---
base-commit: 0e287d31b62bb53ad81d5e59778384a40f8b6f56
change-id: 20240627-fix-riscv-rt_group_sched-d2e014be48da

Best regards,
-- 
Celeste Liu <uwu@coelacanthus.name>


