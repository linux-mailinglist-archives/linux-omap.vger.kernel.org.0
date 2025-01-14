Return-Path: <linux-omap+bounces-3120-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A63A1124E
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 21:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC3903AAFDE
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 20:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C04211A3A;
	Tue, 14 Jan 2025 20:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b="IAKGZc3a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IiUpBfIS"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F220CCEB;
	Tue, 14 Jan 2025 20:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887334; cv=none; b=el4cR2rkflJtK9bI3UFf26aEllOqRv4M1oSb4+QUDm48sIpQguzr5UFuGI+RHrdX0GUqS8zEJDd0fn/Di4uRM4nwCC/SWaghk46BEEyopvca0SRcqY/322JLD6il8NMMZ8Z5mdaKAgXvovtTanAg0pedE1ueLd7qphU4lwThEJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887334; c=relaxed/simple;
	bh=faYQjbUe+IZ6IbLVoFWLES94wJ4yKdbIyLHK1P3reTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUukpBKixbBq/92Q2NbtMpaW39QCBOh2CwOq9c1go1/L+4WW19OciOve+jZsEQQLoTNVz2436NNwL6VWyioQ1sEiHKMw6evAsncs4v4jVJ1IujsYHGQMqex2LnhUReXL0fGjL+aXYahcraIU9VUUCLrlCvp8+fHrejnwyAxVzdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name; spf=pass smtp.mailfrom=coelacanthus.name; dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b=IAKGZc3a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IiUpBfIS; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coelacanthus.name
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3E80D25400FF;
	Tue, 14 Jan 2025 15:42:11 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 14 Jan 2025 15:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736887331; x=1736973731; bh=SoZljfqV8Y
	76xmxQUUDqkab4/v2p6BHdmrbK5iG/0+g=; b=IAKGZc3athbt3hkSGEEWqMY7ze
	mRmr7xsvi+z5vfd4Dyr0vRzQ2GGlYCcw84PUlMvxW8DaNNmw3wBRor1f0F53qaQd
	tHeAPBUuBZcY6Y6STHHI/kGkIAgzqTorwThm7bTMErrdXttKRKmafSTbyk/nl6py
	FBoaTwMT584P+XAj9Q5jdiiaRhcVU1i18N4MMf+sh1G68koVQop8MIe7fhJe9MEk
	OzlMBI2QDety9Jrwp17pPArOswDD6duSaRN2bzUVOima8JIx7fjsbH5mVT8vQCeX
	dB8cW7+ZHZIqPoxRL8CZshzdpehthwupK+h67nIAag0mRbyhtW8PWsuTosGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736887331; x=
	1736973731; bh=SoZljfqV8Y76xmxQUUDqkab4/v2p6BHdmrbK5iG/0+g=; b=I
	iUpBfISPzKBT9yT6zKuwlNp0GG58m7pSzuKPBqLqZajDBABVXrnH5Ej7rfNVibxS
	pTdzrR0R0sdoKDWOiNUXhAq9KWKByoCFXzsp9+y9lQ/zIqsZoeNQ7nCesgLzfjba
	DdzMIThDLkz5tzQzl2M0TqL/SVBVLCG5EmqDC9XdOhD7YgnMeSVA4MecxFIyP3md
	5sHqSjtVuO+22UKXeUlmSTU2R1MwetSUHCLv6A/dWNrZGQQT3BRsFrBcOGMn7i5/
	+0/vM1GFLMlc7rGJ0G4J5WxgFAIfCPWOp+Ya9pkHS5R3ZpjUFoJVi/hXD7ypKipx
	lfQbCq/pVe2nDY9sO9DSQ==
X-ME-Sender: <xms:IsyGZ1t3Yn6qnH04zPLAsVx000nqjRNfc3f5-430jHs1ZFLNvN6BSg>
    <xme:IsyGZ-evAoE-ou6IJQWvHR2XLisQXzveprsua1AWjVD5kDnLVFs6OC9d057HsC8A3
    TlWL7cYohqB6YawfEU>
X-ME-Received: <xmr:IsyGZ4zHgsprho57NuJk5bkjPslGOoc638dlfvw6LGi9Y29u84mB6SXHglIA0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpefgkefhjeeiueekgfffuedvheegffdt
    hffghfetveejtdetffeugeejkeduieehveenucffohhmrghinheprhgvughhrghtrdgtoh
    hmpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
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
X-ME-Proxy: <xmx:IsyGZ8Mq6lokQUjMTkf5-oN1B3OjLrif_hdRo8RWedxw9y2gQ0zNSw>
    <xmx:IsyGZ18rJ9o3HDa-BLd2mBSJkEgf9Vct2BQnF-I4X2lQEp6DFaoDRQ>
    <xmx:IsyGZ8VtH_K_PNRI-CBYupcKeQBpkiXGpfeJRrvxKzwkocRIYmQ39w>
    <xmx:IsyGZ2dMOs59DD0HY4fv4nk5vTi9e65KEo-dFcTw6QYTVuC4HDqciw>
    <xmx:I8yGZ0dcWMV8HEOX3jZUxo-Yz2Htf9bMhBbuTGkwnP730D5XQQGCshfI>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:42:09 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:41:21 +0800
Subject: [PATCH v4 2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fix-riscv-rt_group_sched-v4-2-607606fe73a5@coelacanthus.name>
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
 linux-tegra@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>, 
 Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=faYQjbUe+IZ6IbLVoFWLES94wJ4yKdbIyLHK1P3reTU=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYzHNpGz3RdNkcq+138urdnco6HmLJOMKeQx8/dB
 x+9M/n57GhHKQuDGBeDrJgiS14Jy0/OS2e793Zs74KZw8oEMoSBi1MAJnIth5HhTFFkrOksz5Be
 jqCyI7OyWK2EubUnagjfyV8kYSe7ROMtw3+f+83SDSq+R6Y+//vmimFTUov/35ffOJ3jLvsv+PF
 vwT8+AA0oSNQ=
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

Reviewed-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 arch/loongarch/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 4dffc90192f7816074c3bd4b55c12159d5757676..4387bcec8f484173e5367456a69f6a7f03595d46 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -24,7 +24,6 @@ CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_RDMA=y
 CONFIG_CGROUP_FREEZER=y

-- 
2.48.0


