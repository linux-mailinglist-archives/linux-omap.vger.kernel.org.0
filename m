Return-Path: <linux-omap+bounces-2174-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 281BE9737EF
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 14:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F7711F252F0
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 12:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3951191F6D;
	Tue, 10 Sep 2024 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aja1kEBV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31205190676;
	Tue, 10 Sep 2024 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972682; cv=none; b=ihnc1Ltsd3V2XkgNqtjQdNeB80sOMxM/6BR9AjmRGbVjl347IXp4Q4wZIUhhoz7HBeD4imI7ceUw3LPytn+FRvomJnAEMS7LRcmYg5TVz3K9ohjRGE1zgnZqx8LmSWVr3Okg6XEgLtXPb2xYOXLKa5QM5eldsCBNoHhShWwSqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972682; c=relaxed/simple;
	bh=xt5JaBDuTJrD7O0EfnMDSyenJKkQfXyI8xQwHbDtYuc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tl+Dgu3oPYpV5+OHEe+Dtc04fwcxLxGZzqCYodUTcygBjvgpN0wNmvUDS/qNDxn/tGgaGJGdak0yo9T/NZNbRIsJDX3oc+Hy+s1JlVlaX5iFlycv1qFpOA4RxCYZC+MX7YNgTOjo6KBm3JDFxHQLXbfYPeOCDmNTMzsvplw47/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aja1kEBV; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-717849c0dcaso5000517b3a.3;
        Tue, 10 Sep 2024 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972680; x=1726577480; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HmFRGdMwr20yEnEpySkcXv8bxDquizqNtEjadBQeONs=;
        b=aja1kEBVLM3E6jsffxTpWrwVTRn1bJ4oAR8rEQcqDF5P3QQN7KNphdO8V4Pfa2VZFP
         o3poQeCGP/FMcGfXT5m1/xMc8rfZNPyJKztR8Xv2tkkwKFDst0KkuKkDM5w5Ddi4UP7E
         5zt3DE8eHAPCkDewBfhVQnZoBm1gD23Ll3lN+ZD4CsAQvGVuhCKl3/Pq5wpBCeoX9K8j
         2cR7Fd2mfPslOvuBCf7l8vVAuQEF14POta08yrMwvVq17CH9hE9F58t2x8sSp5cWvEBA
         v/xTNCswkN6oTALOYZvtgKHMuf0OXHrxBx84IO0YHugAEswWSzpyOn3ZxIz5IGvosCwl
         GBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972680; x=1726577480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmFRGdMwr20yEnEpySkcXv8bxDquizqNtEjadBQeONs=;
        b=LT/RVDKdx6duwvAXr/oPW+knkGesoEnDeYLp6yh5e3jpDm5Mo/cGNvI3gtfRQTXG3V
         TBcaTkXIaizdZ2M6laZssluxMKdTUD2mHegbWOPxJXQxueLny22rW2h8ORqxttQdoQQv
         sXJhtEkkjXs4s83Fd66PtD/p/oJXM9CL//4NHPUodnHzrWX6mjnL1B7FLkOrzc25y2p2
         M9r+RQGSls6artPEvmYGxGjm0/DBWHHCxnPS4wGy0Q0A0qWIZb39ZX/b96gp4DJIdKcM
         ZNnO0yZoDwaiDqtQPhzG18ipD559Bab0ShRI3TiVLOmqmTopKsaf5faBdmGGNYSSY3mR
         UtkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHGMVQeLVovNLp+P3wxgOskHQvqcliMjoFdes7hUDt0WXaN8eDmHiaYgfwYKndgW4s0nunhpisglI3bw==@vger.kernel.org, AJvYcCUmEBIUCsL2z0YA6RPCjfRyIhNVn3IMsbqX4WB7CoyFCNu3fc8/sz3X3/mBk/AS4g6DDD4xL/shOVAXtAw=@vger.kernel.org, AJvYcCVbbZK/mFjl5veweJEqPgqPOzwrPHST5D3XX9gnwUnbbVOeVkGlVYguHNOeR06fvvjW7zMJxbR29yy1RpE=@vger.kernel.org, AJvYcCXnfif9QtARYnLc3ozs8EfqbPwn5OzKc3e06uHLMvmKCD4c4T894BLOVTVAyZeUKtR711qclKTms98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNs16DkuHwBpltxXmwDOULNA5HDL66qZs8Occ0rFim1UQWU3H
	IXaEgT9zEjCTmfsP0TiWYdxrwkgzeEB4sbnNbERwtPZx8I7K7EKA
X-Google-Smtp-Source: AGHT+IG248YCrlDAw2xajSnMZP7vlgtd8wgKpLqJSASLHed1IOD9s2TORggoVe5FKne78SHiSh0bHw==
X-Received: by 2002:a05:6a00:4fd4:b0:717:849a:d668 with SMTP id d2e1a72fcca58-718d5e301d6mr19258677b3a.10.1725972680311;
        Tue, 10 Sep 2024 05:51:20 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090d32ffsm1305614b3a.220.2024.09.10.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:19 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Subject: [PATCH v3 0/4] defconfig: drop RT_GROUP_SCHED=y
Date: Tue, 10 Sep 2024 20:51:06 +0800
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALpA4GYC/3XOQQrCMBAF0KtI1o4kabTVleDGO0gpMZk2gbaRS
 S2V0rsbdaEbNwMf5j/+zCKSx8gOq5kRjj760KeQrVfMON03CN6mzCSXiu9kDrWfgHw0I9BQNRT
 utyoahxasRC7UFVVhNUv1G2H6fdOXMuWaQgeDI9RfcJtxIcRe5ZutSldBAaeArTa6H9w9nnE6N
 p327caE7mU6H4dAj/faUb7kj1PI7P+wUQIHVPaqUao6R/FjlsuyPAFxOzqbBAEAAA==
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
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
 Xi Ruoyao <xry111@xry111.site>, Stefan Wahren <wahrenst@gmx.net>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=xt5JaBDuTJrD7O0EfnMDSyenJKkQfXyI8xQwHbDtYuc=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8c9n7cbfzk59X391e8DW8R38Vd9NJK4em3uftmP
 THh++tpfPNrRykLgxgXg6yYIovYzqevl5U++rCM12QGzBxWJpAhDFycAjAR9+OMDCu+8trVyR1a
 +lGiv/zy9oCHhY7+Ol+XV7vPvSXCNFt03XVGhqddz9bJXYvKW3xZL6ll/rsNWR1ST8NFfJ7duti
 z89WtNCYAsCpTEg==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
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
base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
change-id: 20240627-fix-riscv-rt_group_sched-d2e014be48da

Best regards,
-- 
Celeste Liu <CoelacanthusHex@gmail.com>


