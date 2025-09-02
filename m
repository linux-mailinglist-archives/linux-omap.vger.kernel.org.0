Return-Path: <linux-omap+bounces-4445-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D92EB3F75D
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 10:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A90487288
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 08:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CF92E8B86;
	Tue,  2 Sep 2025 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2lPug1d"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA8A2E7F1A;
	Tue,  2 Sep 2025 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799995; cv=none; b=FDo313/LxZkg+xy8MRII29iRLd9al9ldXK9OdBi2pU6D7ubFF2W8ltPU8vPC+CMIW0x+Hu6h0FXfPsg+SEj7Fi9c9F27QoaMtY3eIP4xUPmPAqut6WWymQl1n3bhfuyB4S8wF4fHmBlguPjTbKIodlxv6eF6Z5DAQgwAlxF0HYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799995; c=relaxed/simple;
	bh=Lj9bjlIB3DcURpLLBTkNUByMySpNBduV06sesPwe4lU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PRm8ZnPIIli43gtexgdfbxPEg2ofV2FWChdcIwfVcsNrCKuYKH2iE9/JqGBTVS03gov2MwlIEXXXBAF7Q6ha2kUFt2C3LbqwozcE8nheeGeWPHAuuPgeXMXJ1JLjkLjaa4idpaYgUlFzGf9PvD6Qxt8MJnyrv4MLcmvVgBeIweE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2lPug1d; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77264a94031so734877b3a.2;
        Tue, 02 Sep 2025 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756799993; x=1757404793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlVepfV1a+DpSRQ4He+huYbA4zsiZ1BkZY1wCGkzX/s=;
        b=e2lPug1ddbDzlq5SKbnXfXaio2qQzU17d90iauBv0xbSfa7IL1G1ok4XguFAyUMfG4
         Z54ndSCX2sFjV0faBPKwVW6gsaOwnbdzHGSMGUbwttrBG1nQnUxcTzNkKgp4IaQBIghS
         rOd+31SIkWkcQLVkFjV9RW+IfLK5F9Py4nTie/e6hFXk2j4MeiVLCOjpnU4U13a9q0Yn
         ItEUUwKnbaV0zAi6eIWiIYMXfWzAljRxBkL/2XAVXBetqYcz7AC7ptyLVtqSUWkSQDeV
         nn2TWWVIZV0vtrdW/Fk5ZggTLGKcDQ8tRlz9Of8X7Z+ViooYaUaxMG5DcUOZ+8V0QoJW
         qJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799993; x=1757404793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlVepfV1a+DpSRQ4He+huYbA4zsiZ1BkZY1wCGkzX/s=;
        b=SifyFZiN/MIV9CjWcSoCpIuqKCcRTUBU//ozwpEzS0FDBVCFj5Hs7rGGKGkXYQOA/0
         wpwkA3oRswyx37uO5KMx/+INafP+6onGXLVQOgo3q0yOGaJ2yuvLF4UdB1HhX1FdWofm
         YIlujT3FLq2ZrFBS7q+0FlFcdX5PSOj3H+oJvp2ZGV+CQVvCLVbk9XD7OfKhWLfimE3Q
         dCdjvXRJORlcR/ihwG8xOiwp40HoVMG/zYARRtI2MNt7E+ORW53NA2KOyUg6TWD7w4WH
         ucJs8fgsb7CHlZFuOHEee1lWp+RSRTFbz9h8X9NTVsFO2jMEahtbXqPAziuyNlTOQ+Mv
         5g+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVOJWspNDsVEoewMX9cH86CeoLOsFJKd4nenCihkIoCk3bvccMZV6b+89yfIZr0Kip+XDuvFdjARcbii0=@vger.kernel.org, AJvYcCWt+JvsO2vk5Gai1rgE2vJOqLAZRke9s8cNGn3/5LbCoxutUhp0ski8JApQ0bcC+GZ1TB0lvuBstk9xjA==@vger.kernel.org, AJvYcCXYiYNY7J44nIG0Xm5HeZ4rj2x/b2fNRGn22HxQhIXtJ0fyYU+bkFFInamhOVaGC3azFLBVnYt8@vger.kernel.org
X-Gm-Message-State: AOJu0YzEumdM45wyxi1s638JHqpWi9NTMpKDW3Rlq1ADZurMZ08VnX7H
	zy/4kr5MBMGyuUFRLcS5mH4ktPiCKB+KlabfS6J3aBinpmj8cCu/AdG6
X-Gm-Gg: ASbGncvjyrwgIpCRWFWw6uFEwEeEEEWLz2jU37f7vRgCoyLUB6kdtkMHuFrANbfW8IL
	UPfebjIFccmWztNfPli51YPRJe9SWYi+syT8HNQvwy1vKecfimmGvA+So3bLu36fx9WGZLoOL6O
	SsaLobaZgqKU04W46jTnAJPv0syiGfi2+32D4tnMuB5uCIXJ7Gl+BF0nCwRPqiucdkFfuSYSnVu
	egseogyE0xGQOa1zFioMkzRvIhYmbuyGeVz63N6xHn5y+DUFVVZLD88Ok34o7VdzAYht8Q/BGHM
	4JOyLlAu92zdOk8JUjZH/jxUxVWcCNKpi9Zx7dwnFKv8++bp9FsgccY53qfcsk9hnb76JwcdPRA
	96CEydYbgCYTsa9/k3VKBW57IxJK2HgTGuB9NDj1z83gdS7aNKa9zrJxCqocV7eViJhzsz8m0LF
	ur9kxVLaav8WooF7rEQqvRIRl93DYJebBohitMrsgwGzJAmQ==
X-Google-Smtp-Source: AGHT+IEm+nVTTWs1aKBQDOB7XkIOAjtqqHuK2OSMs8jJ86T3iVRPvjpflAUWrk7SxzYK6gPkJ08Jhw==
X-Received: by 2002:a05:6a00:114b:b0:76b:dd2e:5b89 with SMTP id d2e1a72fcca58-7723e21a61fmr13477807b3a.6.1756799993188;
        Tue, 02 Sep 2025 00:59:53 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.116.239.36])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-772590e05adsm5314995b3a.86.2025.09.02.00.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:59:52 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Kevin Hilman <khilman@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Dave Gerlach <d-gerlach@ti.com>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init
Date: Tue,  2 Sep 2025 15:59:43 +0800
Message-Id: <20250902075943.2408832-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing of_node_put() calls to release
device node references obtained via of_parse_phandle().

Fixes: 06ee7a950b6a ("ARM: OMAP2+: pm33xx-core: Add cpuidle_ops for am335x/am437x")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/arm/mach-omap2/pm33xx-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index c907478be196..4abb86dc98fd 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -388,12 +388,15 @@ static int __init amx3_idle_init(struct device_node *cpu_node, int cpu)
 		if (!state_node)
 			break;
 
-		if (!of_device_is_available(state_node))
+		if (!of_device_is_available(state_node)) {
+			of_node_put(state_node);
 			continue;
+		}
 
 		if (i == CPUIDLE_STATE_MAX) {
 			pr_warn("%s: cpuidle states reached max possible\n",
 				__func__);
+			of_node_put(state_node);
 			break;
 		}
 
@@ -403,6 +406,7 @@ static int __init amx3_idle_init(struct device_node *cpu_node, int cpu)
 			states[state_count].wfi_flags |= WFI_FLAG_WAKE_M3 |
 							 WFI_FLAG_FLUSH_CACHE;
 
+		of_node_put(state_node);
 		state_count++;
 	}
 
-- 
2.35.1


