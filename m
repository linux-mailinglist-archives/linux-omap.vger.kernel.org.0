Return-Path: <linux-omap+bounces-2514-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC99B5E3A
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 09:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99B171F23086
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 08:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355CD1E1A32;
	Wed, 30 Oct 2024 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLwOV+iN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5061E104F;
	Wed, 30 Oct 2024 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730278169; cv=none; b=PfHV+6PvsCNMTFSC+8PnwvhP35z7nw64EJYnzCuyXog/Kut2gc4o9cUiww8aMMqISHpotBTmYOPLMmEPpyY4uHNsGEIFaHmtcN8Sun1a3StCvUrNhIQ9Nfz7lSgq/GT04SYt88A/6o6H/FFORLQdLvIAjyeBcPI7ETs4oONb7EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730278169; c=relaxed/simple;
	bh=s8pue87jX5gYvQDg1uYNOBw4D8VGoEN2B9h0ECvZ1oE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pINKn5TD0n4R35X/z+SbBabSw7Pub59AwL3jrz+xS5eV/7xSGkQR5xl2Qm4S86+R3rF8vsf0mh3hVN6KAakOAJb1oQZXRIeSlysyBmC1PUai29UbnVvZA+C/Qf+HHd2B2GjZUPRSYA4/ZSYk9a+9ykNsA8QOWN2WDPGNxOaL0aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLwOV+iN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cbb1cf324so54131915ad.0;
        Wed, 30 Oct 2024 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730278166; x=1730882966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8pue87jX5gYvQDg1uYNOBw4D8VGoEN2B9h0ECvZ1oE=;
        b=OLwOV+iNlvqVmCRyHurrt+y+KZ9lU8Gho6SHQBbroJjbXrLOaRuBhhMp91RlphOvMS
         UvmFbpeno5WJ5k5jgfqTuQ4NNsOxP9NJNyJfblOdoOPMLq0q6gWAT/guOp2SYMZBVr49
         YrvpMoVczDiFDGfKdzfGKpz29HgBrqTzqiM9W37/g4iwzIBuBvobs93hxgXIr2NI9CPF
         4GOpynSesnFZqg1ud0oFH1gRn7qS5BfA/EHs7SI47Lo9UvldtL17jDbWwnljspMKz7St
         42JX8967orv2FZBApYNg7BN6AtT37qi+6swwef4phhU8WWzNXQEBzk8CtVYH+KgrCQZw
         9EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730278166; x=1730882966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8pue87jX5gYvQDg1uYNOBw4D8VGoEN2B9h0ECvZ1oE=;
        b=maUmATedvF+KVHOJWqxZYIRhXiwTo4FT96h/juLBoNIfCj8wnIthr6M3JnytEi4xpQ
         9JWLhH6HnqVwQmKhlomomfIbcjHz9HSKTzHbfKv2J13HXrbtrEIEVo+XdGwktPk6QAdK
         zyJnKTF9Cybq7rv0oM1EWn5Jn5sipGlfT3sRsooey2dfGN4MJiBGRiY0KSlkNIaxMAnL
         3mnA6ackkMSJV/nTUknrbfcN8seKdSxXibdw7HNdmxGaqhd8hM7FWgnj3SStZJFxEdSb
         2YoIHbJhBEVTTAExhxioj4TRXB68seDDXw6HwqnaQGLqyCVnxm4Q2dTqr+ZcyXYSr60e
         s0gA==
X-Forwarded-Encrypted: i=1; AJvYcCUksk/DdhDXl2xB32c5i0fKvPfTbELgOpd9JNbd6W/iGp0gJkLkirTE4seAFZKsKDfUCMYk+xUTnjBPbw==@vger.kernel.org, AJvYcCVNT0v4wzMuJshIZJE6gfxKB2PTYMWH5Zmtx8+Du6/OINcO0E66AZSMS4gmzuQhZqA1mD2HnsqCdkBG@vger.kernel.org, AJvYcCWPFj+owyvN791QCX+Kfn9W85rycJr+LTQ/XvYI1XHgDDJrzMaXDiSUhxL2QeYAItFy+EmUrkRcCocAHyWO@vger.kernel.org
X-Gm-Message-State: AOJu0YztS/pFCo2WRkLmCit8B8fSJio/PbXDUcEY+XAig+PIrx5SH8Bz
	Kbirtk5olNhce6P+gS545T0mmj+NyOkq05n/I3ueDgiRhDjuesl1
X-Google-Smtp-Source: AGHT+IFaXT+/l28z+wui5WcAiBJLlIhlZnMP7/2poO7/8bUhiEgbgYJRE9mWV40HcoBL1UjBt/YNqA==
X-Received: by 2002:a17:902:db0b:b0:20c:f3cf:50e6 with SMTP id d9443c01a7336-210c6c6ec21mr216997305ad.38.1730278166210;
        Wed, 30 Oct 2024 01:49:26 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf72006sm77429905ad.108.2024.10.30.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 01:49:25 -0700 (PDT)
From: MightyM17 <bavishimithil@gmail.com>
To: bavishimithil@gmail.com
Cc: andreas@kemnade.info,
	bcousson@baylibre.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	robh@kernel.org,
	tony@atomide.com
Subject: v6.12 not booting on omap4, gpio errors
Date: Wed, 30 Oct 2024 08:49:19 +0000
Message-ID: <20241030084919.102592-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
In order to upstream my dts (https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/community/linux-postmarketos-omap, patches 0001, 0002, 0003 and 0004), I applied it on a 6.12 tree which then failed to boot, with the following dmesg - https://pastebin.com/aEKHUjJB

It seems to be due to the gpios not being found, are there any recent changes that occured? Last 6.10 was working fine.

Best Regards,
Mithil

