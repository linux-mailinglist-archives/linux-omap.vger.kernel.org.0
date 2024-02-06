Return-Path: <linux-omap+bounces-496-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BA584AB50
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 02:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50331C230CF
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 01:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEB74A04;
	Tue,  6 Feb 2024 00:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b="UvIsaiFu"
X-Original-To: linux-omap@vger.kernel.org
Received: from egress-ip12b.ess.de.barracuda.com (egress-ip12b.ess.de.barracuda.com [18.185.115.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB464A12
	for <linux-omap@vger.kernel.org>; Tue,  6 Feb 2024 00:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.185.115.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707181189; cv=none; b=Ax5oLFve3UHgrCkJoUlOHXYGGQ1RGHR3Amv7hT/krbOze+dN/ze5S8jwF3B00gUM2IZjeIyBJUJNjhaSWXBtR2kj359HMAioix3jpP061Ds7y66zXCgAociGrTEVV5rrX8mx3CD5t2QUK89Qsbugy77svTrpvkMfgguh6ag+Gg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707181189; c=relaxed/simple;
	bh=/6zDVpTQxTpO8Rt7fqCeo96mpq7mjUP0IlGNFtYHc1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IjXDAyIFk8Pe6jxfPksl/qYHV0JKc+Px/YmtQMOycrgUDvc4upbPvbpfjF59tobzSSkg+JX0BqOdA3goWOiqw3SAn+FzY7letfkFBpfb4Y6L9gbve2y+OV0Tvz6riCjUaWc3KxTNcBpZxkQhgOPiFrm882EnW5GwHiJbJvxBMho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com; spf=pass smtp.mailfrom=mistralsolutions.com; dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b=UvIsaiFu; arc=none smtp.client-ip=18.185.115.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mistralsolutions.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200]) by mx-outbound16-171.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 06 Feb 2024 00:59:38 +0000
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1d5b60c929bso67235705ad.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Feb 2024 16:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707181177; x=1707785977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMXVXJW0OFWoix7qY497nt0fmYOWqwLi2f9LeVZ82B0=;
        b=UvIsaiFu9upnb3HcojI5D513hQvvxkfw1x9B3UY0f85T0Sq7qtXdIl+1bgQ25rNseo
         3I57B73JJSHPwnaoC6ZVqlSE1pUVPZGmeNyqJucBrAr3Rde5lW0D37uOGGJI8neepp4b
         IOC1AANOueHgki1QvHX4UCsRVoAukDrKf5KaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707181177; x=1707785977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMXVXJW0OFWoix7qY497nt0fmYOWqwLi2f9LeVZ82B0=;
        b=VtF5Mx2gZ0y2rVcFU69P3phDdYWaNeN8XRTNtQe8t23jdgH51XqIre60R8CNPIEvvD
         8XbtAr2LKTV+13t5KFhVkYQZxGw7tUAqoaWwfJ2vN8QcqNW+atbgRP9t4YyK9no5CONi
         XpgsoHGIFIjoZB9IK6eq4zArst7DlLoi0gwiKDUSHDjbkaafvgmZB3+HpNeBx4K0kcfC
         JTfTqxP/kTAviIQbCbYLvGtcXY239fvVP66jGn6lXz3TSLUQJECKxAPA8f7gRiVm3485
         mABUKe9ziz4L27mf7SLNYnh9daF24eZ5jvxjaiiAbLmP7sSJ8XSFngFQ/P6UWvYVD0ZQ
         ZP7w==
X-Gm-Message-State: AOJu0Yy6fAEmYOMj4NURliNUVJ1yOHqXguCZjAAYqMrTzwkiQOyAXJIC
	yX8l0Cktb+axzXXo18R4WstOVkKQKLrp3HQX3FqcYc1/KP4SdB7oXkN6vPGib6tqpsbRpv3Q/hg
	6cjHO1QKidp4yxne8EBca/QytRgBi3YwiRgSRchZYveFV/JNLoHuP7BIp3lWR+4wXypjPev0Ge6
	/9G0HiA1qhGeDgJaU8pA==
X-Received: by 2002:a17:902:ef8d:b0:1d8:d5b0:aadb with SMTP id iz13-20020a170902ef8d00b001d8d5b0aadbmr156382plb.66.1707181177690;
        Mon, 05 Feb 2024 16:59:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1Ec5BUuM/8SjurkqK2dgM8NYOaBKTGquT3BUcAgyNf6Xg2XMyEHELeCJkp9kCryCflmVN/g==
X-Received: by 2002:a17:902:ef8d:b0:1d8:d5b0:aadb with SMTP id iz13-20020a170902ef8d00b001d8d5b0aadbmr156370plb.66.1707181177388;
        Mon, 05 Feb 2024 16:59:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXGLWeAahHWmWIqAdH5XKO/jVf2naBPslSxn5hx9J9tTjSY8npnBInKMCPASTF1LwvPtGsuB8Pm4s2HWTI/TciTs+0JJf82FtOqB0TjJ0ByCyzsPPlDwPwvsgtabFIR/2GFksnpUwpFhtun5+aFLhhOyQR0CUryZaznix1EFoG4kBfwP1x5blp7VWGsxo9qldLjmElHCR7+
Received: from localhost.localdomain ([49.207.212.181])
        by smtp.gmail.com with ESMTPSA id le11-20020a170902fb0b00b001d8f251c8b2sm496534plb.221.2024.02.05.16.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 16:59:36 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: Denis Kirjanov <dkirjanov@suse.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH V3 0/2] CPSW: enable mac_managed_pm to fix mdio
Date: Tue,  6 Feb 2024 06:29:26 +0530
Message-Id: <20240206005928.15703-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1707181178-304267-30762-4853-1
X-BESS-VER: 2019.1_20240205.2236
X-BESS-Apparent-Source-IP: 209.85.214.200
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrKysDQDMjKAYsapiSkplkbmyR
	bmpslmyUapholmZkYmFsYmqcmmaSZGSrWxADALva1AAAAA
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254014 [from 
	cloudscan20-2.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_SC0_SA085b, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

From: Sinthu Raja <sinthu.raja@ti.com>

Hi All,
This patch fix the resume/suspend issue on CPSW interface.

Reference from the foloowing patchwork: 
https://lore.kernel.org/netdev/20221014144729.1159257-2-shenwei.wang@nxp.com/T/

V1: https://patchwork.kernel.org/project/netdevbpf/patch/20240122083414.6246-1-sinthu.raja@ti.com/
V2: https://patchwork.kernel.org/project/netdevbpf/patch/20240122093326.7618-1-sinthu.raja@ti.com/

Changes in V3:
Address review comments:
	- Add the same fix to the drivers/net/ethernet/ti/cpsw.c file as a
      seperate patch.

Changes in V2:
Address review comment:
	- Add Fixes tag.

Sinthu Raja (2):
  net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
  net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio

 drivers/net/ethernet/ti/cpsw.c     | 2 ++
 drivers/net/ethernet/ti/cpsw_new.c | 3 +++
 2 files changed, 5 insertions(+)

-- 
2.36.1


