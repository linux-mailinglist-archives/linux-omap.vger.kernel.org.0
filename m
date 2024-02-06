Return-Path: <linux-omap+bounces-495-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8284AB4F
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 02:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0B74B2360A
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 01:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CEF1864;
	Tue,  6 Feb 2024 00:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b="N9Oce5vF"
X-Original-To: linux-omap@vger.kernel.org
Received: from egress-ip12b.ess.de.barracuda.com (egress-ip12b.ess.de.barracuda.com [18.185.115.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1B04A02
	for <linux-omap@vger.kernel.org>; Tue,  6 Feb 2024 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.185.115.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707181188; cv=none; b=McqsBX7z2DNVHx1tFUpCF7ygQ4OlrSJTckNB4hjVlGKGZ230IrEzAKRWnf77ceHbPC0H8hP8lMlyMM4KASvlCSTzhn9MOfDchsJx6X3CENIfNASd1o6CIXmIkQQJh3+Xp8YA7jYUM2NpQigVgJkziwAXn5tgKdz+ek3mKMA6vTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707181188; c=relaxed/simple;
	bh=HoeyniJL4CsApGog4Sdv28aS5xczQ9ENGv9KZ37K+DI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oSLUT4RHhLnqDVIiX8qL8qXaE2CFuZdDVsmg7znlfvoM8bxeUKvs9XeFBoUPOixP/sqRBi/UH7KdROMaiYUYizgWJwUUOnlTLAjX8qqqOIIhl3Q6eRpFB+JJecbQ38FwItO0ZKq7970saE8VfQo4NgSgqRnrlYYClLD8KWGhm2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com; spf=pass smtp.mailfrom=mistralsolutions.com; dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b=N9Oce5vF; arc=none smtp.client-ip=18.185.115.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mistralsolutions.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound16-171.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 06 Feb 2024 00:59:44 +0000
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d4a645af79so65566665ad.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Feb 2024 16:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707181181; x=1707785981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+QAWQkhJS0aM4Kf+2AGAjojBhRe6YamH1QrMQeunrM=;
        b=N9Oce5vF4DSbrbBH+GgBuF0fuSiimIcq2zsh9bIhsk6nQgdAuEeNJ7nQGMCLCN8fqt
         XYhutT3zr2okfhk+qkXf2LLEVbOCyMLG8M3DGKDFj8ani115dQRgLMc/pTx47yLNaIE4
         UCBqbar9pgI62POIQjwxtO9fkUWXzPHxIrlpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707181181; x=1707785981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+QAWQkhJS0aM4Kf+2AGAjojBhRe6YamH1QrMQeunrM=;
        b=bvDvfACtZfxR2/eEA23VLugxnJ0FOY9ewj4l9x94jSjU7KZS9FgkNihB1eBCMYjN3M
         0ZICjuG2HlnIgYhduqzZ0DV39PKuR0N0bXKAlrp8ENNl4XplaYEOQ+hJ3nEUaoetBUJe
         0CoPrwhyl220iWZmymNhlgY1WdkvNmWsM1rU//ChilHAC2jil5/RITrMbo7Cc5isH6W4
         SZY0hBlhyn4F4XbSFeM6vFAZZ4lzWTC59ErnKgNWQ4d1gl0WlAs8WbzF1A83w0sFdzpm
         nEfKCKZG2xpTsO2GKsLAXkUJU7DbwpiFXed+doZzdJtt0nT925MSzOxdyp8RIBF2JhJj
         GVag==
X-Gm-Message-State: AOJu0YyycaFXUXnmF7GLJYfSUwAz5G9vvmVTFlBK6UVjxHwy90Q4rbJy
	aMdm7K+jW7PKFfEvo4D2zGkeCsYbQxYMvpyuYmylB20YljrfIAnfOo8rUg95fBtxBSf1i1u5VRF
	plz0gQAVHJ7dnGmbdic1ju2xiUsjJzkr/7ZrZdYpGvag3LUvs2vsebTFAhR3yxkZ1pdm0unfxDn
	v3unrsSSQzpmpL81HHEIzFFnYBOg==
X-Received: by 2002:a17:902:6b44:b0:1d9:bc11:66e with SMTP id g4-20020a1709026b4400b001d9bc11066emr159904plt.37.1707181181506;
        Mon, 05 Feb 2024 16:59:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa6lgXZfjFTE1WeLQxNnJQG9cCVUVzc9IZYWuNPgmvPnX/EKfhoSBTE23fASM1vyTnKbROAA==
X-Received: by 2002:a17:902:6b44:b0:1d9:bc11:66e with SMTP id g4-20020a1709026b4400b001d9bc11066emr159885plt.37.1707181181183;
        Mon, 05 Feb 2024 16:59:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUgGUdcJO/rMjWKaqgxD2VTI38z/8rfDvr+/aHlfjiz2gPIOCzRPcTCxzc52uW+5dUBXVccazrENfLLv4JzIdSNFvae4dD2ovgFN/FYT2UiC11j336GtWED49jcYatv8JIS0Q3ciK3LYlvaxY5TXOtIsULHS2/AH0VLGNdU8Xr4fmhA4paUAFWo4hKV4IK6s5Hm6XKgz6+YZWHXwDqoPkr38ofEmAtoFzssJjRBJP6c
Received: from localhost.localdomain ([49.207.212.181])
        by smtp.gmail.com with ESMTPSA id le11-20020a170902fb0b00b001d8f251c8b2sm496534plb.221.2024.02.05.16.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 16:59:40 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: Denis Kirjanov <dkirjanov@suse.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	Sinthu Raja <sinthu.raja@ti.com>,
	stable@vger.kernel.org
Subject: [PATCH V3 1/2] net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
Date: Tue,  6 Feb 2024 06:29:27 +0530
Message-Id: <20240206005928.15703-2-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240206005928.15703-1-sinthu.raja@ti.com>
References: <20240206005928.15703-1-sinthu.raja@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1707181183-304267-30762-4856-1
X-BESS-VER: 2019.1_20240205.2236
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyMjE0ArIygIImRuZGicamlm
	lJSZZGphaJySmWqUlGZilp5sYGlkmpRkq1sQD8VWC5QQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254014 [from 
	cloudscan14-232.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

From: Sinthu Raja <sinthu.raja@ti.com>

The below commit  introduced a WARN when phy state is not in the states:
PHY_HALTED, PHY_READY and PHY_UP.
commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")

When cpsw_new resumes, there have port in PHY_NOLINK state, so the below
warning comes out. Set mac_managed_pm be true to tell mdio that the phy
resume/suspend is managed by the mac, to fix the following warning:

WARNING: CPU: 0 PID: 965 at drivers/net/phy/phy_device.c:326 mdio_bus_phy_resume+0x140/0x144
CPU: 0 PID: 965 Comm: sh Tainted: G           O       6.1.46-g247b2535b2 #1
Hardware name: Generic AM33XX (Flattened Device Tree)
 unwind_backtrace from show_stack+0x18/0x1c
 show_stack from dump_stack_lvl+0x24/0x2c
 dump_stack_lvl from __warn+0x84/0x15c
 __warn from warn_slowpath_fmt+0x1a8/0x1c8
 warn_slowpath_fmt from mdio_bus_phy_resume+0x140/0x144
 mdio_bus_phy_resume from dpm_run_callback+0x3c/0x140
 dpm_run_callback from device_resume+0xb8/0x2b8
 device_resume from dpm_resume+0x144/0x314
 dpm_resume from dpm_resume_end+0x14/0x20
 dpm_resume_end from suspend_devices_and_enter+0xd0/0x924
 suspend_devices_and_enter from pm_suspend+0x2e0/0x33c
 pm_suspend from state_store+0x74/0xd0
 state_store from kernfs_fop_write_iter+0x104/0x1ec
 kernfs_fop_write_iter from vfs_write+0x1b8/0x358
 vfs_write from ksys_write+0x78/0xf8
 ksys_write from ret_fast_syscall+0x0/0x54
Exception stack(0xe094dfa8 to 0xe094dff0)
dfa0:                   00000004 005c3fb8 00000001 005c3fb8 00000004 00000001
dfc0: 00000004 005c3fb8 b6f6bba0 00000004 00000004 0059edb8 00000000 00000000
dfe0: 00000004 bed918f0 b6f09bd3 b6e89a66

Cc: <stable@vger.kernel.org> # v6.0+
Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V3:
	- No Change

Changes in V2:
	- Add fixes tag.

 drivers/net/ethernet/ti/cpsw_new.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 498c50c6d1a7..087dcb67505a 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -773,6 +773,9 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
 			slave->slave_num);
 		return;
 	}
+
+	phy->mac_managed_pm = true;
+
 	slave->phy = phy;
 
 	phy_attached_info(slave->phy);
-- 
2.36.1


