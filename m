Return-Path: <linux-omap+bounces-330-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B332835E4D
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 10:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA6F284CD9
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 09:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7902239ACC;
	Mon, 22 Jan 2024 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b="Y0UviTW8"
X-Original-To: linux-omap@vger.kernel.org
Received: from egress-ip12a.ess.de.barracuda.com (egress-ip12a.ess.de.barracuda.com [18.184.203.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B1639AD6
	for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.184.203.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705916031; cv=none; b=ZxVsuBn7W2348kzWJBcd7R6TdgvIp8QRNK27dMC456iKx8TGwnpy1EyBIlNvq41VmoS1iBgxdbPCqbLfwGTFx1Fy8mWwrj49/renohEguKChmMB5Wk6pmJw/BBOtCIvrZo4aOSCvYW5MhXgbHJ8mHx8cQUUiOu2xtlBhmq/xzDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705916031; c=relaxed/simple;
	bh=P0+6uEwIBZU3BYlRAcQRybTZdpBi1s2dNvZ0BgFAFog=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SKMKU7nKJOe2nMjhyujz6d2xdxB3HJtYaSbdnxW5JrtHMn1cTRzi8AkBH/MbzByCv0O5PK/BpJLEuz16GRjq+arplJcbzFzT22Rbf5X5p4Df5i/IqPh+rSXDwDfeE9uwt2d3AF/n6mY9MYCi1XWp/esYykLT3ZCqPjKe/ZaMByo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com; spf=pass smtp.mailfrom=mistralsolutions.com; dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b=Y0UviTW8; arc=none smtp.client-ip=18.184.203.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mistralsolutions.com
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200]) by mx-outbound47-118.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 22 Jan 2024 09:33:44 +0000
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6dbce7783d1so947331b3a.0
        for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 01:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1705916023; x=1706520823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3x9YvWePqbJz0Vi8aYxV6T7rpjQm9a56asqJakSWOE=;
        b=Y0UviTW8CVgxX/XHiLhO600iMT5EPFCwU/fuO5GgquLEUAlIH8mjh3CsnB/1zkWS82
         Ehcs7JjarLJZnJd48yPcuhkKxH8Tnl/gWvnfhOIpsXn/8BJk2WLseLKRmV+HmS7c6UNg
         ni426VTO8pcmY97I1OCFFWyV2u7q0uqrhWs0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705916023; x=1706520823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3x9YvWePqbJz0Vi8aYxV6T7rpjQm9a56asqJakSWOE=;
        b=OeGZFYX9MtpBwU9xPEeUbQYvFi0gYpUzcjgIzDHo9p7ItetSs/MqDlR+GsBf407/wG
         0kxPd0Je8Kg/oMX/SMJBvukxi2LG5xvJe74goXqRbZTeh92/M7LSGvjccoxBszAuAUDv
         Eo8ppakeQ3Fv5tWGmTw8E8Rv3JECten/QuiTRyzWz+Nxwnn4FD7e6Ckshc09geT2ZSB4
         oWctOunS/xIPzCwUVcsi/U/rU40TdgHPb79C25e/eMGCU2ELl7RSF3jj1EXpboZQ0msT
         9kmF0gBBL2pxFR7f1lIsJ6IDAUVVUwomnsiTWyvIEB4O1+oeNNSlUXaIrvqcHR4ottuF
         RO9g==
X-Gm-Message-State: AOJu0YypKUTu0I5t+lOSna1PGRSzcNQqgbaZZJBSEdR+yUYg7jhu9c8A
	WgxAf+ciNruWQI/14R2r0pqi/C3EaUBu5PhB/0VVhyHzMw9ZQ/GHMtW0ppFwmACKwQTZujVQ+x4
	syryZ5A+P56wIiwIoMjLjjM+HmYANA/9gLqt0tmtEHQYJwZ1PHwNGhT2YHQ3bzAsnSGnn4bRcs7
	lTjEQvLeBhGNkdoLYFwA==
X-Received: by 2002:aa7:9848:0:b0:6db:cdba:be9c with SMTP id n8-20020aa79848000000b006dbcdbabe9cmr1104162pfq.54.1705916022795;
        Mon, 22 Jan 2024 01:33:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRJ7YfbuOaZxiKuVCXGS0I90m6OLHu7E9lHmU6ZWmtVqIoDzlXxbZG7nN1qnTTewOyLQcilg==
X-Received: by 2002:aa7:9848:0:b0:6db:cdba:be9c with SMTP id n8-20020aa79848000000b006dbcdbabe9cmr1104153pfq.54.1705916022450;
        Mon, 22 Jan 2024 01:33:42 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id w17-20020aa79a11000000b006d997b5d009sm9150756pfj.69.2024.01.22.01.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 01:33:41 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: Denis Kirjanov <dkirjanov@suse.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH V2] net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
Date: Mon, 22 Jan 2024 15:03:26 +0530
Message-Id: <20240122093326.7618-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1705916023-312150-12409-1704-1
X-BESS-VER: 2019.1_20240103.1634
X-BESS-Apparent-Source-IP: 209.85.210.200
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyMjEzB7IygIIWpoaGyanmxm
	amKalJqSkGZubGBgYpScnJlobGqUkGiUq1sQAzQdNdQQAAAA==
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253677 [from 
	cloudscan13-52.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_SA085b, BSF_SC0_MISMATCH_TO
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

Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V2:
Address review comment
	Add Fixes tag.

V1: https://patchwork.kernel.org/project/netdevbpf/patch/20240122083414.6246-1-sinthu.raja@ti.com/

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


