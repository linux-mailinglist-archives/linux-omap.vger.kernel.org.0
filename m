Return-Path: <linux-omap+bounces-5527-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DEAD38CC1
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 06:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6678300A3FE
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 05:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6252F329E6D;
	Sat, 17 Jan 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFyQOzPo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3AD314B60
	for <linux-omap@vger.kernel.org>; Sat, 17 Jan 2026 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768629282; cv=none; b=hY6plKlzqf+iUoSHRUOfX3zLzSmnKpcFGw3HnoGzP0UHrn9HZPaCA+QWXZ8NWyh5P4VwEkwgif3TC2MEm3xhI6wkci6Rf0sL4EIA7OOHT4+8KmsXqosoIDGbBbQb3qsTMGZminGtwx8S+RkowNVbxQBqN2YWPSYODC7sJJzuwHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768629282; c=relaxed/simple;
	bh=X28oz4Hqu8C9OrNAoigAJocOtIUCqP9c5jKWoshxS8A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F9Gj5SNdGHSGeQx+As1Q4aGz1CmLh1wBwsTapHsCWrKWBv+lb59qHbEQIPALithBU6KG2yiiSaCMC/+Q2Ej8wiR9ziyHlNI0gBYRKtRrz5MIz+eDc7k6ZzNk8O3f7SG7zbM96Rf4C46L1FbtAWmImcJKV5piwQdPQ8u6Dl9wj9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFyQOzPo; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c03e8ac1da3so1033278a12.2
        for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 21:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768629280; x=1769234080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/3Y2YH3nM767IcqTvERX11GvwkdtC120hdoDxqBZKew=;
        b=LFyQOzPorXJunsHZVvd2JKEQoxTrPZMc2PXAORIkJIDwazBca9x1UeW614FnKUk46W
         5sqXe+fvZHnWnQAiQXX7k0Ybia7YVROUnPSkmFc1ALQM3ELPbY8RAeJLwJESRcneJpbz
         Bv3KTE4w4NAlYbam0PBu11ncJtSyoxKSdnN31DbNopNArBFKoWOrMOYoNLAgSQG3FkAm
         2sNFTA234aqrLLZqpvAu4GfRRwUDI3/RSZcl+c28v/BxzRa+BOhaUQ7DK1liqlU3/ivV
         qzZB+h6/abccnfQVku07xcqOhIoS2AOdebWkn1ubF9oCUeeK4pr/c0+yDSY+iufZcasw
         GzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768629280; x=1769234080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3Y2YH3nM767IcqTvERX11GvwkdtC120hdoDxqBZKew=;
        b=xFyETbf3kmzRntspNsL+yX9X1pzPpuWeHx2FiPXEXamMV2W3w9u+9U+aHF+0G2uRyS
         6QVMeOuPKL0PGML7Oupnzy3/PRub27EQxTIltdspau4O+qFU/VBxIdSnY7Yq/kNL/9qh
         Jkb3+21reg9xLl8J3/1r6JsNiGom8EZtGRWDWI63EctuX3d3U3s6bcefR7+WDpNxIx+o
         KzmPyNZbP/rvcxGFx7vRzmfFohq7x274xDM8cYOmVAVf8RqJGsIwWCFd5iuNK4zpst7T
         s7lbe3D0kdefZ+PQnKT+yVHFohvDgTYfzKCuWacfwP2YEgUtRXvk1l06Zs/sC7eZJnUU
         /TJQ==
X-Gm-Message-State: AOJu0YzKiJgJvaKegdA2mSVeHxIt8QrmyOsiFdAbiX7JXdUEsIptpsnp
	8Gvsc9121UPI8Lvpyh/21Iuan9uU3H+VC0qJ41hrl9msZU2hAh/uaRjs
X-Gm-Gg: AY/fxX5FSfihawnadmik04/gSX3Yma7XWh4o9vyN8VDIGThpm+/yYHHhkXOsiNKzqZD
	fVPqVI8vZlX19Oyp33ho1CkfYko97srS9ICSNDZ1dKcTekGzN0YKy1NCXfI9Y1FfdgVAXnuFjuu
	G5EcOwJtU6x1XCWCSCV3m44W+pa7Z8IPppIaT3c6tyz7YFVdCGUBQYiHwWf2hTa2iDQHNF+4dBA
	3cOXWt2zm1bqB/WjtpJF9OVE1TsbKtgxVGorTB0tg/aif+qdpnbZyHFiSgVX1DyiYGvHFG0DZdf
	ANHcuakeMfj6D0PwXpqAq5A9uvFY1z/38CCdArNVw1oXSGOtJsAaJAg+q8vFHh7Wu2HlH26tEIE
	XvulOBDD4TX/GDx6pk+Z/nqF5ym27n8lymFTtRTATW+0bfagDznNIgOUkjnh8GX7MdxM4diiSMY
	V3MgPvEvfpAr8AP3rolsWNr5W98l9yhO2LEZwzQQrT9V7z+OXKzPyCJBM+X36kuIlTWg8uoMxdE
	Zyou9WUF/tLFn/cqKogNI4eAKI5tIaZVpKZqyhev3olAbs=
X-Received: by 2002:a05:6a20:5499:b0:38d:f0f3:b96f with SMTP id adf61e73a8af0-38dfe7b8b24mr5870030637.64.1768629280156;
        Fri, 16 Jan 2026 21:54:40 -0800 (PST)
Received: from c8971f1abf06.ap-southeast-2.compute.internal (ec2-54-252-206-51.ap-southeast-2.compute.amazonaws.com. [54.252.206.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d175sm3413091a12.23.2026.01.16.21.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 21:54:39 -0800 (PST)
From: Weigang He <geoffreyhe2@gmail.com>
To: tony@atomide.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: ti-sysc: fix reference count leak in sysc_init_stdout_path()
Date: Sat, 17 Jan 2026 05:54:33 +0000
Message-Id: <20260117055433.416027-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_node_by_path() returns a device_node with refcount incremented.
When of_get_property() is called to get the stdout-path property, the
reference to the "/chosen" node stored in np is either leaked if the
property lookup fails, or overwritten when np is reassigned to the uart
node path without releasing the "/chosen" reference first.

Add of_node_put(np) after of_get_property() to properly release the
"/chosen" node reference before either going to the error path or
acquiring a new reference for the uart path.

Fixes: 3bb37c8e6e6a ("bus: ti-sysc: Handle stdout-path for debug console")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/bus/ti-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 610354ce7f8f0..091cdad2f2cc6 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -696,6 +696,7 @@ static void sysc_init_stdout_path(struct sysc *ddata)
 		goto err;
 
 	uart = of_get_property(np, "stdout-path", NULL);
+	of_node_put(np);
 	if (!uart)
 		goto err;
 
-- 
2.34.1


