Return-Path: <linux-omap+bounces-3027-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E8A04E93
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 02:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C136163312
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 01:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7EF22611;
	Wed,  8 Jan 2025 01:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="N4443kDS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B28D2594B0
	for <linux-omap@vger.kernel.org>; Wed,  8 Jan 2025 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736298947; cv=none; b=MGald5Jb/xiAWOPJGmGpUT6dqtJMxHyVZiMl0xLF1u4iZWpExjgBCrorVHXkYCgz/LgjsZVWfH8tW6OoPM2488FE4hGScNskMbg/vuftS7Whb2xU5m2lKv9Q1e2X/A/FMU+eZGLEx8Gc9Wt/s0LzVTHXoocGDtXx0Gmmn/OAhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736298947; c=relaxed/simple;
	bh=wC0KvLZixctolVzUbRPpj3ROClenpjGmskrwoo1/vhY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ApmSkjve7GRrtOxD8P6s3502kuivW9T6BXqkT6J0Zlj8jNUEM+Tb9lBx/GxZWKx0h2UE6+FCPyfcEKxxhJuXM9ISpShCOMr2B541pT6c96eQaiXJa0uW2eap+g5j+ws72lqwbQkNaECwZN1kBdpkc4q8Eqgk4TwANA3OVOThzlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=N4443kDS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso23793235a91.0
        for <linux-omap@vger.kernel.org>; Tue, 07 Jan 2025 17:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1736298945; x=1736903745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bgoGy2K2Bju6ucVEvJ1q/0zc2bILGu4t4131+qTB0T0=;
        b=N4443kDSW/UTCy6qMf3TmxHhkcqJ+rIh8AA2RinDvncZSdqel2q8nYWgotwhGBqlAp
         EwIe43m3IrmQHzbV960Pv9Yv7bvQIxp9VGAnPPHiRuHrgtZJLAlx7n4VyEzN6bhQXX5R
         aVAu8nc4/9nVU9Ru7gfEaA7NjZ58vvLNzsH8PJgYK0jYaWNkqAgGFZIpICHiHKhfr846
         s9uZPdaDR7snBlWZ9Oz9DzGLmeBw7STFn2D+hODXNqpdDNEK/Zzjhh+YPJMfohqnzogy
         CSY1LSwMefIbNNA0IM8hoi75u97Q/TVmETyfEycJBoMlbglMfyARjz0Mh24xtXzFPe6s
         HPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736298945; x=1736903745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgoGy2K2Bju6ucVEvJ1q/0zc2bILGu4t4131+qTB0T0=;
        b=cAHQ7J92sHF1r9EbR2RUP4YSet7psV68euREJCEbu9Vxi7/HrK2oOdBdJcFCuGtl32
         Y0KouA9HUW2CxO1UkbTP6G+yAcY8a1d2AjLE9yxxoa0OVeO6AcU6CTnyskGV0Q+VfxHA
         eUPuTIxg4WMFlSt79cYzqrbePnyBIVndbyVoFIihpZRvR6MSGb1LzYv1Bmejy1snoBL+
         I0Z8PHXIUsHTnWdOIskYmW+qiCZZQj9tr6ChpykShCvn4uPR65qrtfv0+HTd7ZlzBccv
         xcoIEFAf+UzhHN4Si4Eymk5VrcDG4Al9DtYCSeOLeNAuyM3ZpBolEgdDG9l5pzhku2nq
         2hzw==
X-Gm-Message-State: AOJu0YyIWYJOPVBEwlcZjlOGdY4jzUrFLCY5br/etdKXMNXk06xWlpPO
	1asG5Ya9gg9bsK+x1qwbjS8trWLp7QUEty+9Yney9OA4KrQhpE1ad8sA3mbNG4w=
X-Gm-Gg: ASbGnctlHZ2V+ZUu70IQwlZ0G42yRIi/46C1W4DCyyMsa1M68umeolfJ/QH73U97MWK
	OCNHYeorT+mG6/tqQoLNh7wN61G6+iPVmjQJ/RkRD2MPjVeV9Lf2RQtsaAhh7RezByT7g1jzPrg
	NCJqX3CfNaka329+n5FJ8LUiGNI0hmNsKcFxeI3Npg332wWTmQgVYn0N5IYwbJtwDTxZ8oeEH1b
	+sHz5faTyOG047RM8ih3TScjhNTS1OUvtiIHHBwXXHEgcjlu+uRhXPyBDO4hM8eg+VsL74eiKfa
	tztnunJiONbU8Ntrk8CliJlfRQO26gfXa09o5A4dLxo=
X-Google-Smtp-Source: AGHT+IHU1ZkIsfiNx+EPzdk8izZaT5ZVBeEmenKlyuYU53DxxcX8+dv8iEMxhG2CPmD/jXJSYh75Jw==
X-Received: by 2002:a17:90b:3d47:b0:2ee:aed6:9ec2 with SMTP id 98e67ed59e1d1-2f548eae904mr1561645a91.14.1736298944698;
        Tue, 07 Jan 2025 17:15:44 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a34dbb6sm203658a91.42.2025.01.07.17.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 17:15:44 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: deller@gmx.de,
	kuninori.morimoto.gx@renesas.com,
	laurent.pinchart+renesas@ideasonboard.com,
	elfring@users.sourceforge.net
Cc: linux-omap@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] fbdev: omapfb: Fix an OF node leak in dss_of_port_get_parent_device()
Date: Wed,  8 Jan 2025 10:15:37 +0900
Message-Id: <20250108011537.2748127-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dss_of_port_get_parent_device() leaks an OF node reference when i >= 2
and struct device_node *np is present. Since of_get_next_parent()
obtains a reference of the returned OF node, call of_node_put() before
returning NULL.

This was found by an experimental verifier that I am developing, and no
runtime test was able to be performed due to that lack of actual
devices.

Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index c04cbe0ef173..7c636db79882 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -36,6 +36,7 @@ struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 		np = of_get_next_parent(np);
 	}
 
+	of_node_put(np);
 	return NULL;
 }
 
-- 
2.34.1


