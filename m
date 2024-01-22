Return-Path: <linux-omap+bounces-328-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D374835CBD
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 09:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA458286C91
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 08:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3BF2134F;
	Mon, 22 Jan 2024 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b="ed5v4r0X"
X-Original-To: linux-omap@vger.kernel.org
Received: from egress-ip12a.ess.de.barracuda.com (egress-ip12a.ess.de.barracuda.com [18.184.203.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927E364AE
	for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.184.203.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705912520; cv=none; b=FIXmeOEgBzc+VvrS7v93V9MzvkvtXFZgwdNlRFOieqnZySWLp5Pg4cZJ9TaaRP3QYEr+o98DfPDYVH81PeIK+fukuNK5Dy6yLZX7zn6iDho/sqVk1LbtFElHBrhe0vtWIO/sqz4ZaKjIpFZysIcLK0NrPFyQjRJkr3g+MWJRpQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705912520; c=relaxed/simple;
	bh=lGacBdisexfSrE+r5NS0I3w6U8FixtUsYI5Qb5UG0bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MQZLx15q0GTiVdMaLMupVrcWIjBJEZRp2jNysLeIeW3MgrtrGD7oQksuja8J0nO/+MXwLoFGMebHjJ68UcO65ucqONmMpSY2y2/SeWKZJmS8gORJiyRf3htc+DEpA9GHfkzDpiZRGwcTYoPNHwKJhMNcND29qiIJ8AflM5oMjRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com; spf=pass smtp.mailfrom=mistralsolutions.com; dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b=ed5v4r0X; arc=none smtp.client-ip=18.184.203.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mistralsolutions.com
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72]) by mx-outbound10-238.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 22 Jan 2024 08:34:30 +0000
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-21087fb1fdbso3069542fac.2
        for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 00:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1705912469; x=1706517269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Yf78X6NhNlvkenuax1KpRQIa4Bds6kUX+jC6ly706c=;
        b=ed5v4r0X4if3cbv2giYsGyeWZVIbeSNDP4sH6oCS8z6uVtaoVsDWyjRr8magLyQibO
         kUZyM9EPnk3gjtUpAjVVWPc+KcejU/ddrg8GbWSX0RqmwNaxz55AP0rZkD/7TZCwKNe9
         CWaj4x+hxQYvKDPnCimfvx6miLX04j/G6Ow0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912469; x=1706517269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Yf78X6NhNlvkenuax1KpRQIa4Bds6kUX+jC6ly706c=;
        b=XKo3EoCXebw53r9/+I+wGvYtu3uaeL73XmBMtGPKXhvZ9BGMFa5L/jl57YMAOImlaB
         OxIWPytQ+a+If9JcMSTlyqb3is0AgZVC1HtdebhJ6ZUQt6G3OWPY7TnQOb5tgH1AC1m4
         GSiIJX2xQL43IAITizbKHdjIywYJ82+1R+iBaOZxbpg6AYU+V6lRKrT30StVwtzpSbNq
         PgZ7WfVQTjdqRR9QM3ymIBlyojXW//pM9v8UdayXl1GIwh+/mdSzP5m5b4CiSBv3Dmay
         D/vYW38/WkRLnGWJp12Ub8yHkYDH7ilSpm/QCo8nq6riL7Af6BFhXTBGkseXNwZcFyPG
         IIzw==
X-Gm-Message-State: AOJu0YydAA1RnKST6VHDP9ueCA+ZyqgE8z+lR08oBcFGUTTlAdWbsRrT
	PVr2MFHLSutLH+Q2kmfYaIs9agCNs5s6hGdOGCB4cqFqKQD6arBE5f3pyVSn38QJVYMH0poEDjB
	qipj2tWafn0KsTMbJKFQjgTYjXO6LclxyHRyaJkWeZnq/JJbH1igp61EPnmTj5xO+LmeHzl5RH1
	JdYap+Ugw2CvUqU0Zc3A==
X-Received: by 2002:a05:6870:8304:b0:210:9d93:983 with SMTP id p4-20020a056870830400b002109d930983mr4641470oae.23.1705912469396;
        Mon, 22 Jan 2024 00:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAA3QDz3RS9Vh4eKdi3ce+9gKoRGw4TMA270vltqSaTUT2Mdt3C+JNU058g+sLA/b8ansIKA==
X-Received: by 2002:a05:6870:8304:b0:210:9d93:983 with SMTP id p4-20020a056870830400b002109d930983mr4641464oae.23.1705912469132;
        Mon, 22 Jan 2024 00:34:29 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id cm7-20020a056a020a0700b005b7dd356f75sm6895023pgb.32.2024.01.22.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:34:28 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH V3] net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
Date: Mon, 22 Jan 2024 14:04:14 +0530
Message-Id: <20240122083414.6246-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1705912469-302798-12457-1165-1
X-BESS-VER: 2019.1_20240103.1634
X-BESS-Apparent-Source-IP: 209.85.160.72
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyMjKyALIygIIWRiaWluYmRi
	Ym5mYWBhYWyYlpRsmpqYlmSQYGSYmpyUq1sQBnvoa+QQAAAA==
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

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
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


