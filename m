Return-Path: <linux-omap+bounces-3119-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D204CA11249
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 21:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A036116A723
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 20:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2C220E709;
	Tue, 14 Jan 2025 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b="YH57aj+O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UdI02B+9"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48220E005;
	Tue, 14 Jan 2025 20:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887328; cv=none; b=T4y9FVm2iOsd2cHJGrVIu5DrZF7CEoOeLo756sTqWdtDyYTakCvp0xBHpYajM1XG+HERPPGRZnkiZDoW3qz7tVHTVKq8rPiiGju5f24svEw6fiYTjIT2aQc7ZhKa9dUoG5QOqyns0j5iEsFuGdekWDa+h/EOp/I4h3DefceiMTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887328; c=relaxed/simple;
	bh=WkvIObUchYpAilmJK89a2+ds4ehlRbbV+Uqcck4hmYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFlvdutAbOPTQKmayrDAkSpEx+oyhYMDM+I3CkAI4aWOUnthXSZdlGhR3clxpGufeqPot86I+JWOzi9wBR7acIAIksIw6/9+gBFuu5cn+/PtzVyljQ4LfOMS1ygnnq5uFAvFEFx7sX9LxytIx6p6fv0dHvyr63Qr1qdlj2JpeWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name; spf=pass smtp.mailfrom=coelacanthus.name; dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b=YH57aj+O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UdI02B+9; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coelacanthus.name
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D475411400CB;
	Tue, 14 Jan 2025 15:42:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 14 Jan 2025 15:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736887324; x=1736973724; bh=G+TEiYNlY0
	62v675yUdgWXwYQfH2PLhBA2LiyUaadgQ=; b=YH57aj+O9WFA8KiXGhA56PD/El
	vs4vYkqg7DqvUCa4QySoCLF6fJKn5ea+yGjGIrt1kWUs6z4buWBIpDmlZr1Bdbxb
	Ub5DxUiheG/vg0ALwk0RGxm3aLc3xwJirIwg+MEq9IYCsGeNMw0r9PWNCVivNCu/
	ZS/zo2g8pha4mSOj/5zdFLRsqDCoCAK0jaRtcvhJd+LRDe/5pOVq2h5/vdtdcDAl
	jQ8AMClnfWTAaHjaV5HqLwVadK1ptSb+199bFbRw0+h3CeRJhmX2Sl90V9dp/To1
	2YssGh8+PguoDlSnkFKQh03gMyYOAmWbLKF8HhUbfqAfW+tQRyHLsItQJACw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736887324; x=
	1736973724; bh=G+TEiYNlY062v675yUdgWXwYQfH2PLhBA2LiyUaadgQ=; b=U
	dI02B+9OgXBAO8VPZlBm+qO13y2UuJ5WxSOIw/vUR3XD6JD9YMopBUKGSmJ1BR13
	jY1uISp4uhco6wQlC2rXiSb9qGe1ge5c+FZN/+uhWHiHIjKj4KDEwC916ZSGZX1r
	SCfot0KxGRu6Ux+0hgbx9CLeAivvthda5nnYnp1E07v2wczK78+3DNM/rqj1Yg67
	pIadtl3ul7QNq9p/Zs9STu0psK0LzFM5ShleTLcV84xt/6xunCHmra0NfgeNOxA4
	FqyBHslHpEYBHxqW8kzIbmdkBf1lQbVE9eEDSOi8Es3L8iu5Jgff+b6FlREC9d9r
	r6cmdEbBTH7PXRnKnyNvQ==
X-ME-Sender: <xms:G8yGZ8ovRi-XB40q05ejGxFKEVaijHM5xESImxMnPlJwRVW8Onhkjg>
    <xme:G8yGZyrx_7F2nCe8sj7wgOjJbP7VAMXXYnvCn_ZtabJwNGANz0BR9X1L7dNdlgJ1m
    Fmvh96v9ozxNjLydFY>
X-ME-Received: <xmr:G8yGZxPDvXL0goYwtJLEMQJIuaLqZs2knTQkVd8VrEsYkYgcFXkX1wPGjWbWlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeegfeekfeelteeufeekleeukeegffef
    keetveffffethfevheevjeektdelueegteenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprh
    gtphhtthhopeefgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghi
    thiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepuhifuhestg
    hovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthhopehjohhnrghthhgrnhhhsehn
    vhhiughirgdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessg
    hrohgruggtohhmrdgtohhmpdhrtghpthhtohephhgvihhnrhhitghhrdhstghhuhgthhgr
    rhguthestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmih
    guvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdroh
    hrghdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:G8yGZz6NduzkIgRFd7Z9G0sC-BJdoMB_M50PKK3diBl6OFZakadBhQ>
    <xmx:G8yGZ76by2bMD_Sogun2RI1gqcs5MkkoH2l40gN87skOineY-8ZX5w>
    <xmx:G8yGZzigrIqC8QeBRkt1H98bgrNOLkBvaVorZaPjsi2q-lGgqUptVA>
    <xmx:G8yGZ14ZsNmq8Fh8nUbliIVr_m70fHr1rqjNbr7GRnLObLly7YmHwQ>
    <xmx:HMyGZwZlazZrL1DGG-6d2_VenzsEYQ_8S9pQw3HTuh3Dnve29aVo3Zmk>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:42:02 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:41:20 +0800
Subject: [PATCH v4 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-1-607606fe73a5@coelacanthus.name>
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
 linux-tegra@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=WkvIObUchYpAilmJK89a2+ds4ehlRbbV+Uqcck4hmYI=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYz7JZzu3m/esxYasXrc/3aJMUnP55MOzQjsTiBq
 Seg9WqipkpHKQuDGBeDrJgiS14Jy0/OS2e793Zs74KZw8oEMoSBi1MAJpLfz/BXtuPp5Qf6PQtd
 TGe9Tzi5LWZZ3vVca522z6+Y+d6kPv8RyMjw+ofpP9fk2b+37mTferiEddNnkwnxn94lXNFfr20
 fd2kKMwBcoU0m
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
introduced it because of Docker, but Docker has removed this requirement
since [1] (2023-04-19).

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[2]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[3]

[1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Acked-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703eb35757419aa5a2b057c82ed22fda..46b8fb30726858a945a24097773174961c2f4d10 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -10,7 +10,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y

-- 
2.48.0


