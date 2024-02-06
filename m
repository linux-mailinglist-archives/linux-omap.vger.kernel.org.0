Return-Path: <linux-omap+bounces-497-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8F84AB52
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 02:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94D991F25A31
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 01:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1FB15D1;
	Tue,  6 Feb 2024 00:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b="AV8iPH4R"
X-Original-To: linux-omap@vger.kernel.org
Received: from egress-ip43a.ess.de.barracuda.com (egress-ip43a.ess.de.barracuda.com [18.185.115.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ECD1870
	for <linux-omap@vger.kernel.org>; Tue,  6 Feb 2024 00:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.185.115.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707181190; cv=none; b=QhC8lXRu/m/XbmblH2ggMzcPbaui1qtQ2chLzACM0nsJInkF50vUK/YonkWvDDSvW6pU/S6/Lft82ITDcNYrcrt3JApUsl3x0BUXDh7AHNxyzEaf6JSRZJenT0ii3RePDF+Tw369av6ewTjpacNy/MK24TSJSl79XnpljspiaRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707181190; c=relaxed/simple;
	bh=PFuA5xdtIgOFSyw72kpYF/uFFQ62cuFVyjApG9Z1ftI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qfxvPRwvKM+pjEoJPdZWRqKZalRcZc69GRytNdeAg2kMVIBXhdkl+ZU8a6mF5x9gl1uVNSSv04ycCwWFRcpD2rBTTpu7szqpMdbaThLVz7lbwu/tNX9ySLlCqQ725k+UQzkyv2TYbjQw3OUKM86XQdZoMCcKdNu/rSJFCv64Ta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com; spf=pass smtp.mailfrom=mistralsolutions.com; dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b=AV8iPH4R; arc=none smtp.client-ip=18.185.115.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mistralsolutions.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound10-206.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 06 Feb 2024 00:59:46 +0000
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d9853bd35aso22283515ad.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Feb 2024 16:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707181185; x=1707785985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbWRmcBkwMEecTwCDQa265tRUPfMy5uFyAEgQ22r9b8=;
        b=AV8iPH4R4HndhYhWatGBkVUAbsDDxNh0cntdBBuXFJyWcufbIRvhyh1xsoxs0lE6Aa
         v+SNyBgrcArrXBDk1Dgd3tp7Ma832OCdVdaOSnhuGrU3dOMKsIZ4pmwMb9BZPOLal6tY
         d+KYls4aavWKYTNMOZtWzIc5PXccWrDLV5ayQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707181185; x=1707785985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbWRmcBkwMEecTwCDQa265tRUPfMy5uFyAEgQ22r9b8=;
        b=DHTJeeFWxLCtZxppHn2wz1I/cnOj79pTxbZIuCruR/SsxEdKklPFxr0QVtVSfMWN4+
         7fK80rdamDIow02hPTlrbv85pLyG3723HAzjOtZJ3ZKHrSoIVUd4Jh0DjXHtM1Kv/zNX
         r124DC7LAOgmGrfeyP8nqC/R9xpJHJlhCe9foILfJXi97Iw5rcUd5s03NEGXPtMgZpks
         wxxhhNXdyp9cNFDHLg3X+eol8yi+noTTsJUMXOZnXdWorUZT1ZBKw8qXJulBtKPdHyyp
         qCn4hZFyytSpvCnu5vAcA6rL89r30+jnS3HqQY6ZvJ9KcmeaZUX9I2YGa2Qr6RfxrU6r
         M0fQ==
X-Gm-Message-State: AOJu0Yzn3wj81m9W31evITr3uVecClyBoCqRunVETRIdtVBFPN4dW8+J
	FzbeRgXD19wz92wf4yAjrRbj9ozZKPC2hbE5E7vdDmlTBU7ZG3C9DmB774jlIw8/s0N0DkswSqj
	pDFF8decPYgcMH5eZDUg3YugviFLFFdEN2Una9wrWMiGQMYMvKzau5jV//isyY4qdQNSamXfX0v
	loskQ2OYeolNq1uyeKZQ==
X-Received: by 2002:a17:903:48d:b0:1d9:620b:89cb with SMTP id jj13-20020a170903048d00b001d9620b89cbmr187742plb.13.1707181185323;
        Mon, 05 Feb 2024 16:59:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOAtgjSgJxtQ0OWsnBbJCqmPgsXPZ+A3CqZT44gif2wpYXXlhNKWQ4M2WB42yhHBLvg0k4kw==
X-Received: by 2002:a17:903:48d:b0:1d9:620b:89cb with SMTP id jj13-20020a170903048d00b001d9620b89cbmr187720plb.13.1707181185001;
        Mon, 05 Feb 2024 16:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWz/WSqyM10dRAG0UpNtz48TCpwSK/9J6LcnyWL7CyLcLv7sHdiB5wyp6X9o2IaDjsJ7MrT7O77b38629bOz/H1BtbigQrNgoVY5xi+jUndtH41j9kZ3H9JYa+wk1eBP26O2xxlClOfXFSeSvcwpBkGMiX3SFV9pqyFxmQHn7S7eQrL3p1l+0k1FShba1fWhxbm/p8OrgZ3TVdAt3omfxroGoJ4GK2g/Jw8UaRwT2Tj
Received: from localhost.localdomain ([49.207.212.181])
        by smtp.gmail.com with ESMTPSA id le11-20020a170902fb0b00b001d8f251c8b2sm496534plb.221.2024.02.05.16.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 16:59:44 -0800 (PST)
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
Subject: [PATCH V3 2/2] net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio
Date: Tue,  6 Feb 2024 06:29:28 +0530
Message-Id: <20240206005928.15703-3-sinthu.raja@ti.com>
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
X-BESS-ID: 1707181185-302766-3502-4669-1
X-BESS-VER: 2019.1_20240205.2236
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyMrI0AbIygILmiaYmJmZmqW
	aJSUaGZkbmxmbJacYpqSYmhpaJxmlJiUq1sQABbgJlQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254014 [from 
	cloudscan20-2.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status:1

From: Sinthu Raja <sinthu.raja@ti.com>

The below commit  introduced a WARN when phy state is not in the states:
PHY_HALTED, PHY_READY and PHY_UP.
commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")

When cpsw resumes, there have port in PHY_NOLINK state, so the below
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
 drivers/net/ethernet/ti/cpsw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index ea85c6dd5484..c0a5abd8d9a8 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -631,6 +631,8 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
 		}
 	}
 
+	phy->mac_managed_pm = true;
+
 	slave->phy = phy;
 
 	phy_attached_info(slave->phy);
-- 
2.36.1


