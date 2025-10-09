Return-Path: <linux-omap+bounces-4659-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD234BC7F26
	for <lists+linux-omap@lfdr.de>; Thu, 09 Oct 2025 10:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686883BC34A
	for <lists+linux-omap@lfdr.de>; Thu,  9 Oct 2025 08:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA61275844;
	Thu,  9 Oct 2025 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TjQs17cP"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD9C1ACED7
	for <linux-omap@vger.kernel.org>; Thu,  9 Oct 2025 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997523; cv=none; b=AjwAs07l0Pc/lVoSgBMaM33DGvurLOEl70Yr0DrWUiAusjz5vBrCTu6e5SCZg9tHEwGgOavAwHaBk9p9svt6B+o7ciVGl7lOlQF+GlKKyXLfNuvljBzENwzMC4A7CVTTpdU5TvmIN63bO437qJ3iuEtgH/s1uy6twjXj9Qqxys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997523; c=relaxed/simple;
	bh=U8tr+SxRfzwnjqzinRNnRrOKmodEgXSGM2QNYSxJjoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LWqZXj2vYizPI0QGpHXgdHQ0vjjJ9nppSz2cuX3K8kbOL/FUwX0M+sFj9pxpFwsPH1uuh3nVaO+61/8oYXNL/A8A/28XWeak7gmJc0sBEH9FLAzJZ8BaTpLGvayJb6BccN8Gg6ZfjPQ156P8ARry5gkqK/agHB9eNQw+BRu3QR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TjQs17cP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759997520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jqAoY235TtK5GopWepk4TStErN4mYa0iReCxaOrqgVE=;
	b=TjQs17cPYpi0b9MZlBDyaIQzUIBjc5E9Ie36PwKm0L0pNiNbrx07QscH+hIvGpBvX8Ifd7
	+K2DP5G7iBp/yDM+39EQpWMhhIeFmm+DVBaatM+eo/1uR49fLRme4dz9b/XYzwKWJgNa0t
	0G89sOFZZG08dMr+Y/iFG9+7KUdsUtA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-12-Oj2DihmQOBaHbKWoRB_-tw-1; Thu,
 09 Oct 2025 04:11:55 -0400
X-MC-Unique: Oj2DihmQOBaHbKWoRB_-tw-1
X-Mimecast-MFC-AGG-ID: Oj2DihmQOBaHbKWoRB_-tw_1759997511
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE01C1800451;
	Thu,  9 Oct 2025 08:11:49 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.33.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5018E1955F22;
	Thu,  9 Oct 2025 08:11:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/2] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Thu,  9 Oct 2025 10:11:35 +0200
Message-ID: <20251009081137.117411-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembler and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembly code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, we should standardize on the macro
that gets defined by the compiler, so this patch series changes all
occurences of __ASSEMBLY__ into __ASSEMBLER__.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

The related cleanup patches for e.g. x86, parisc, sh and arc patches
already got merged via their specific architecture tree:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=179e949719fe81
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2cb74be378675c

So please merge the arm patches via the arm tree. Thanks!

v3:
- Split the arm patches from the global series
  (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
- Rebased the patches on linux-next, fixed the conflicts and new occurences

Thomas Huth (2):
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/arm/include/asm/arch_gicv3.h                |  4 ++--
 arch/arm/include/asm/assembler.h                 |  2 +-
 arch/arm/include/asm/barrier.h                   |  4 ++--
 arch/arm/include/asm/cache.h                     |  2 +-
 arch/arm/include/asm/cp15.h                      |  4 ++--
 arch/arm/include/asm/cputype.h                   |  4 ++--
 arch/arm/include/asm/current.h                   |  4 ++--
 arch/arm/include/asm/delay.h                     |  4 ++--
 arch/arm/include/asm/domain.h                    |  8 ++++----
 arch/arm/include/asm/fpstate.h                   |  2 +-
 arch/arm/include/asm/ftrace.h                    |  6 +++---
 arch/arm/include/asm/hardware/cache-b15-rac.h    |  2 +-
 arch/arm/include/asm/hardware/cache-l2x0.h       |  4 ++--
 arch/arm/include/asm/hardware/dec21285.h         |  2 +-
 arch/arm/include/asm/hardware/ioc.h              |  2 +-
 arch/arm/include/asm/hardware/iomd.h             |  4 ++--
 arch/arm/include/asm/hardware/memc.h             |  2 +-
 arch/arm/include/asm/hwcap.h                     |  2 +-
 arch/arm/include/asm/irq.h                       |  2 +-
 arch/arm/include/asm/jump_label.h                |  4 ++--
 arch/arm/include/asm/kexec.h                     |  4 ++--
 arch/arm/include/asm/kgdb.h                      |  4 ++--
 arch/arm/include/asm/mach/arch.h                 |  2 +-
 arch/arm/include/asm/mcpm.h                      |  4 ++--
 arch/arm/include/asm/memory.h                    |  4 ++--
 arch/arm/include/asm/mpu.h                       |  4 ++--
 arch/arm/include/asm/opcodes.h                   | 12 ++++++------
 arch/arm/include/asm/page.h                      |  4 ++--
 arch/arm/include/asm/pgtable-2level.h            |  4 ++--
 arch/arm/include/asm/pgtable-3level.h            |  4 ++--
 arch/arm/include/asm/pgtable-nommu.h             |  4 ++--
 arch/arm/include/asm/pgtable.h                   | 10 +++++-----
 arch/arm/include/asm/probes.h                    |  4 ++--
 arch/arm/include/asm/proc-fns.h                  |  4 ++--
 arch/arm/include/asm/ptrace.h                    |  4 ++--
 arch/arm/include/asm/system_info.h               |  4 ++--
 arch/arm/include/asm/system_misc.h               |  4 ++--
 arch/arm/include/asm/thread_info.h               |  2 +-
 arch/arm/include/asm/thread_notify.h             |  2 +-
 arch/arm/include/asm/tlbflush.h                  | 10 +++++-----
 arch/arm/include/asm/tls.h                       |  4 ++--
 arch/arm/include/asm/unified.h                   |  6 +++---
 arch/arm/include/asm/unwind.h                    |  4 ++--
 arch/arm/include/asm/v7m.h                       |  4 ++--
 arch/arm/include/asm/vdso.h                      |  4 ++--
 arch/arm/include/asm/vdso/cp15.h                 |  4 ++--
 arch/arm/include/asm/vdso/gettimeofday.h         |  4 ++--
 arch/arm/include/asm/vdso/processor.h            |  4 ++--
 arch/arm/include/asm/vdso/vsyscall.h             |  4 ++--
 arch/arm/include/asm/vfp.h                       |  2 +-
 arch/arm/include/asm/virt.h                      |  4 ++--
 arch/arm/include/uapi/asm/ptrace.h               |  4 ++--
 arch/arm/mach-at91/pm.h                          |  2 +-
 arch/arm/mach-exynos/smc.h                       |  4 ++--
 arch/arm/mach-footbridge/include/mach/hardware.h |  2 +-
 arch/arm/mach-imx/hardware.h                     |  2 +-
 arch/arm/mach-imx/mxc.h                          |  2 +-
 arch/arm/mach-omap2/control.h                    |  8 ++++----
 arch/arm/mach-omap2/soc.h                        |  4 ++--
 arch/arm/mach-omap2/sram.h                       |  4 ++--
 arch/arm/mach-pxa/irqs.h                         |  2 +-
 arch/arm/mach-pxa/pxa-regs.h                     |  2 +-
 arch/arm/mach-s3c/map-base.h                     |  2 +-
 arch/arm/mach-sa1100/include/mach/bitfield.h     |  2 +-
 arch/arm/mach-sa1100/include/mach/hardware.h     |  2 +-
 arch/arm/mach-tegra/reset.h                      |  2 +-
 arch/arm/mach-tegra/sleep.h                      |  2 +-
 arch/arm/tools/gen-mach-types                    |  2 +-
 drivers/memory/emif.h                            |  4 ++--
 include/linux/arm-smccc.h                        |  6 +++---
 70 files changed, 132 insertions(+), 132 deletions(-)

-- 
2.51.0


