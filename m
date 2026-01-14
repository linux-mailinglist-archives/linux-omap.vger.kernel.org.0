Return-Path: <linux-omap+bounces-5480-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEED21A37
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 23:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86172301F02C
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 22:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226373A9D98;
	Wed, 14 Jan 2026 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qQj2aDH1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7527234250B
	for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768430554; cv=none; b=VOIZv4NWixdqmD6d42QZlFCrwam9k9M0d6f73HZywrjqnez08MQo5j2mjqvfU3dQVUQn++J6rdEkJL9B/QAt3kHdnm3NFeRlrT0kXII5oC8CTkVZIO42e++/VFOhIjRn0dHhLP4IwTCGohoDtC0XxK/Vt/WQXLBgSSXdVMAR6lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768430554; c=relaxed/simple;
	bh=FsoC5ZXVIM0tPvsgw+kQrOtyl7nYAB/8v6gWuJPFCrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CWxVxt6GQHAXjThDc6wggE4M0KlWyQn4vsufE47mXpBVXylly5m9rpChqmHsMi7sgTmx0kMp5vzWLSE3gOIjQnJiWFNw9zcGkOQhdoxQzGCRT+eSWPP/f3O5dGmDgS9zKXv3hERUcXbAdJQnyTWTzO7YTN9nrt9D0+ig+r1wSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qQj2aDH1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0834769f0so2192065ad.2
        for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 14:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768430544; x=1769035344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mq+7e6HHgulV0HLjSWXnWUAjSy0Qs9edOct4mk3Fy3A=;
        b=qQj2aDH1eXj2Uyw8N5GCdNw2JeYK+YBDNspEGd9ipUWH0Tu8L4HK+8DiJPN7+LhrYO
         nWStZAzdQuRbGK3gY39BNl8+X0OKeelc0NcqAskVB9c5xSPEaHKzLeTlbbo55WDheNJn
         2+FWDJhN+Rs98waGiSXJC6VPkp3e0uLpyrhYlP5n2AOpoiP+x5U3XaH9wb6ESdrxW44+
         hYvSbZZCpG3hiYIuwNtqtBQByvPD01455JpAXJ8klzGB7rE+K4f6AG79k/KgLOUZyszO
         VBCvH6iDI/o5pxbLh9lhaRv8mQq+dJnJ+LXsIshD4RTAhL/UArDeZnGG33bsPiPsN1Yi
         ikDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768430544; x=1769035344;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mq+7e6HHgulV0HLjSWXnWUAjSy0Qs9edOct4mk3Fy3A=;
        b=Z83c5mWyUr0CEFPvnSP5DR9JKXQa1L/re77AeRbQG+/+wJpMjnQSTInIWzgRklnECb
         WS4vrwuONAXHMScr+qX9AQ0U8SqMf6xjHiu7mSG9e4PguPO9Jfkkbef2+vWF5enqeo+R
         +hlgya0YUurChsinCI9JdzJ+vtRO75+wvwGiyjBuwSOOiQ5XlU9qsLxjfLQeFRyzwwL3
         d9heAWTnZ3FfdFb51NO9PV4X3dFMDRFpe3pFd36EWZzGGN7ttkELePXagKCgH4lPjl14
         e1fFI2KZJdoxHhS2Bb1M/6WMc50Sx/wYaPW2HwI0HiWT3JOIIeEA/eWsmtO63WbmbyGP
         IQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCV+VVnCKhojlmBskvJZaGadApLG/7rJA/3PAwsvaG2xhHp/Z7DkUV8txbzqQhYgnKMD7A1nalSbWE6o@vger.kernel.org
X-Gm-Message-State: AOJu0YxPUWHZ7nAxoZScSSZNxo2NejX2euGogDFUdIZpN5gZMQ1YNFD3
	3VFpf2Pz+LISaI9lsZRuWEq7al4eSJCzrtZUrG2azFr2NpZSQhBGP7ddf/CfcLWSOos=
X-Gm-Gg: AY/fxX40S2bP4veZ+z5B8K1jIjWFsR5s1/nVQkAiCiVjpiXPfgFR4ZJYJ3xnjBlfARm
	f3wrfV9yLlTfDCtdMW6Ps5ucsgkvNdro3+YCIWfHoXZC6GdJUyaQRseaM0QwzJM9zJsXPUK5si/
	fOT+n0Q0JBWc3klMrtIP8ESaNrTFOvMipQtvDdz/zpyQq7mF+TUOYbCXAnYyT79R8JP5/6Smu3c
	dFaXYg5p3bsW/FMBB8t3rl7p3rHtjunkK9OtTP4wdbCzzhrNV+W4dWPxAvL99+1oaT7WqFG/NrV
	tzS0675MuWnfJVkdX1NiDa7mR+XHn4dbHU5asMLE3NoIQXckNQv6np24oztZCFJW4ejVEFCZw7s
	GftYz+F8PAj4V4T5ji6RqOSn8A5KEw9sH54891RhaOvGqciS2ZkFqdfwLhk9ROPyLeoDGpHnJzG
	yxtyKERU8SUs6sGLuEG8Y=
X-Received: by 2002:a17:902:d58f:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a599dac14emr43196155ad.11.1768430544458;
        Wed, 14 Jan 2026 14:42:24 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48dc1sm232455225ad.40.2026.01.14.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:42:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: andersson@kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
Cc: baolin.wang@linux.alibaba.com, linux-omap@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251124104805.135-1-vulab@iscas.ac.cn>
References: <20251124104805.135-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] hwspinlock: omap: Handle devm_pm_runtime_enable()
 errors
Message-Id: <176843054363.3597156.2942719740253822601.b4-ty@baylibre.com>
Date: Wed, 14 Jan 2026 14:42:23 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Mon, 24 Nov 2025 18:48:05 +0800, Haotian Zhang wrote:
> Although unlikely, devm_pm_runtime_enable() can fail due to memory
> allocations. Without proper error handling, the subsequent
> pm_runtime_resume_and_get() call may operate on incorrectly
> initialized runtime PM state.
> 
> Add error handling to check the return value of
> devm_pm_runtime_enable() and return on failure.
> 
> [...]

Applied, thanks!

[1/1] hwspinlock: omap: Handle devm_pm_runtime_enable() errors
      commit: 3bd4edd67b034f8e1f61c86e0eb098de6179e3f2

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


