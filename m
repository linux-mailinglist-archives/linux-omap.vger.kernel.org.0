Return-Path: <linux-omap+bounces-3121-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B640A1124C
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 21:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B6957A4640
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 20:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76561212D6B;
	Tue, 14 Jan 2025 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b="L8UK+qNt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tj/+nmxT"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8148F212B34;
	Tue, 14 Jan 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887340; cv=none; b=tg5ITLsRI3nDPyjJY6LxLgDyuqqf4s91gm43sYlxhrBjNEAkv91KOA9p7DWYgCLOl/HzqAtWZoy/FA8QxczgJwODn+Ry0SSWIViwonPFJzH0CCshwui8EohwQCygSJxcdF9mZn4xWhT5CVGYxlhI2CH2Qz/s3XxomU5MbsbKS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887340; c=relaxed/simple;
	bh=BhZXBD4LrwRi3kBTuqWLXE3VKHJ0GCDQScQEjxdA+cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPPBXZmD7XzL+sIRd806b+C6nXA8MwoQqIbsSvrnsSceCWFFHFPYoM/QG8KDB+GRLno5PCyMIQzvgFngbQVDwErWKSKxF+8jqi6ubZLjYhCNW+9zMPeVR+MQnr4QaGlfMt0PtBb287P0Jp5zTWD+y9pU0HOurQEJRRxiGrIJ+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name; spf=pass smtp.mailfrom=coelacanthus.name; dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b=L8UK+qNt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Tj/+nmxT; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coelacanthus.name
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id D7F9611400D1;
	Tue, 14 Jan 2025 15:42:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 14 Jan 2025 15:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736887336; x=1736973736; bh=l/AGE8pJh7
	GgNRDEtM0gaQGj3X0ZPhDFL8vEdG1DJNQ=; b=L8UK+qNtsmAFZQ+3hTNYAXZIpB
	Qr13KJDajs03XLtUJ5I+ZEH0mOVmXZ3rsNRiNEWx+547dJ8K30+6aOuZYIoPAofL
	VXNFcJEUV/fPhXRue16Yqgb+VhoM8VJXH3JovgIFMPL0Mg6euHE6Pog9n8jt8Vtm
	DO1sLrPvlNBFeXEWZ5HnPzd/ZjjAtQBMRaOfBfS9lNLtG53P3uKB2ur4rXTOKn6X
	qrdjomrCEeY0zr9E5TB9wNEFjEW3CTWE2fUZWHXlj8SREE9Uhnt9JrJEdR/Yc8DQ
	1FXmCuryCrUZTv4NbBmVFP728Vht4AwZ6pcOfuJYckNrpFhpHy2Bz8sBXl+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736887336; x=
	1736973736; bh=l/AGE8pJh7GgNRDEtM0gaQGj3X0ZPhDFL8vEdG1DJNQ=; b=T
	j/+nmxTF/xg51kX7Zt5H8xXFAixMs0vIuoGDDzf0bNzFF6QfwPx+wyhEPb8qBqKk
	3YnAbrOPq6rK5uSYl7oCtB6bcPSvYdPf8L8ooOYw4PwkM8WkVhrdo2qElr1ieXIQ
	hrWUWrbBLyjeqyrqhf6zQVG703aUCfLIrR5yLC/rq7suim71bS5nuB+wLT3KL7En
	QnhgBBgDLBXugDc4uX2KFSZXk73Slme9IVDBdrj01GJcFy4NtzExpdcR+LnAPZ0r
	0ZoQWHyegmG8vP1dXTDxG9kUw/jFQiWJvP4h/MQ10mc2XO5UXIPeeT1W7fJ//EWx
	gYSxKSBmJzRmxTfMSFyOw==
X-ME-Sender: <xms:J8yGZ8BPPFyZZgY0VeFT-K8Rx8m5zEuE-L_GQ1ekgVmyDV9lJPEe4g>
    <xme:J8yGZ-iQSsLljrFuX004ql6q_iYcQmCNBy4qY7A9oQjLKdjTzgveI6ldAVbi4kWIL
    GxoocCjxxGxa4VILUY>
X-ME-Received: <xmr:J8yGZ_l6MHXkb7K75Z56YeaGrBFnBWYk76l1XLPeq7OzzcUCbNtsaRMkI0pnNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpefgkefhjeeiueekgfffuedvheegffdt
    hffghfetveejtdetffeugeejkeduieehveenucffohhmrghinheprhgvughhrghtrdgtoh
    hmpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprh
    gtphhtthhopeeffedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghi
    thiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepuhifuhestg
    hovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthhopehjohhnrghthhgrnhhhsehn
    vhhiughirgdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessg
    hrohgruggtohhmrdgtohhmpdhrtghpthhtohephhgvihhnrhhitghhrdhstghhuhgthhgr
    rhguthestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmih
    guvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdroh
    hrghdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:J8yGZyx-jwTVnE98BQslgJg8IrgRLe5mRexsgAKl1tAJ7E9KF1neTg>
    <xmx:J8yGZxQFSJHuHrvDQgcIU0QdGyxN72lQs_rbOfnjKaEPPLYWf8DSSw>
    <xmx:J8yGZ9a9kBdXKWM1jziJfYU9oBLUfJqBmsvOGi5t--0b2D-bHzClvQ>
    <xmx:J8yGZ6SpFBu2WG9M-nypt5XZ6tUIG0k0NSfomO7CG8db-W-VP9KAHw>
    <xmx:KMyGZxDHF630JI_6GPEE2KCHBUT1BPaXfGKINgDCuD-5LBjG06KoahJM>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:42:14 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:41:22 +0800
Subject: [PATCH v4 3/4] sh: defconfig: drop RT_GROUP_SCHED=y from
 sdk7786/urquell
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-3-607606fe73a5@coelacanthus.name>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
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
 linux-tegra@vger.kernel.org, Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=BhZXBD4LrwRi3kBTuqWLXE3VKHJ0GCDQScQEjxdA+cU=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYznD2fd8RwHNpoculb9K0DbSGum9JK0po6eNP3r
 XvhzbsqR62jlIVBjItBVkyRJa+E5SfnpbPdezu2d8HMYWUCGcLAxSkAE4mXYPjFdGNfLecKz3NZ
 c/l+va5WTKo7y3prwpVfJ46wr578m4stjOGf0c+3AjpK3ydda3l2lrmxVG7ynlsv1Z/xT9xxwKV
 oxbfTPACIpk1T
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

Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 arch/sh/configs/sdk7786_defconfig | 1 -
 arch/sh/configs/urquell_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 07894f13441ef622c3af8d8f4b5770c2ab66bcd8..7a6efd5b4a62463381005072a679a8ce022a2ef9 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -17,7 +17,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_CGROUP=y
 CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index 00ef62133b04ded8d0b4221f11e0adafde99d386..9cf4a719001ea5ef4b031c1bbbf8098e8af5a2b2 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -15,7 +15,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y

-- 
2.48.0


