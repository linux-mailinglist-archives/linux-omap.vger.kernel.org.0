Return-Path: <linux-omap+bounces-2612-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07329C1984
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 10:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA411C22C29
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 09:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AD01E1A1C;
	Fri,  8 Nov 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6v1iiJF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80481171C;
	Fri,  8 Nov 2024 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731059477; cv=none; b=BdVn07Ivz41ycNLDJdR/9Q75YrFGlV9oIHSro1POG7JvneewnppcOlPihhBsVWyef0D5XC/RTGwvUcXvaXb7VsF+nPBLEAEFeAUmFKIUhDMpPrsh4h9sTEBN6WifG0GPO7jzWgetnI52icdl1hVOfixh+H+uZuIceSehk1BRRNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731059477; c=relaxed/simple;
	bh=o569N3IUorRe0DerXVU26Xh5tuvQG108cbhE3IbkRzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMYIzs/hUlvSmQmu76CEu9jEO6sjH0ghzPzSQjDqOwoGLBqSgbnM4EuXUsBmcJ+z79pL1dzQX9L1Ozu0y4hXziyqH9OD0I3DKq1Z2s/CygJv53qvBFsrhCUaVe2iEaY/watwo8yiAn6utov4sXWU+LrRnDs56C5cuJUh6h7F6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6v1iiJF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-720c286bcd6so1677592b3a.3;
        Fri, 08 Nov 2024 01:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731059475; x=1731664275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSOwvZMj6U/xwMuLmLq/h/sl5M7VCiHdcXvuWsv1msg=;
        b=Z6v1iiJFXn2FfrCBD4AYFk64rkodoPeSJkMjkcJeJ0WD9+rG5a+6i5KY+KDj1RaI6N
         InPElE+wZlArifs9epGUThUY2sWmnr9/FSuAKBJ+SiayiqgLchaYomx5SSunPuOw0s7T
         8duOQXll2t5VzlzMS9DB4nX3fjQO52rYVSiDWaN3Y5XY6fICXp/xaX+3xrBjeYXaD0m5
         F1UnisHnFZdVtHqGiryuCNVq5Ns/n9EIdKqcl/jp9mRA03JHogBVys9YEcY5eVwZq3I1
         JPJgKh7MLW0/VQKCt0joBsV4OjrOtaeEqKU6egvHG6Snz3/665CN2lBXS8oVWZCPsgPm
         axfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731059475; x=1731664275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSOwvZMj6U/xwMuLmLq/h/sl5M7VCiHdcXvuWsv1msg=;
        b=mQ1g3aJg2VlCLxOFSJ1+I6qhRY5v/O2psmoSVVdwc0KKHjSrF35ujr09mMI/M1ynYb
         pasTq1qmPpTG0gAlz2m3Tzk3wf861dNZdi8patF2FbFGJeuhr1lHbVHzWbI6AUKvrfKC
         MrTUqDJFiaCvpNqxYfQuIgSz0CPZUe7DFJKxcqW6q7wAT8dw11nHBBUwZIVMLlDYeN7/
         XWXUFHYHSAt1crXntyEPpk/8rfoFtub9C2SrcMyTVovwHbDXFCEhodclG/2xIkMI3OlS
         jsuyRLHK1PaIHLcwAgtSoG9h3cOOl/CTGOdexc/pzzt5xypswYLd82gBVLeaoY89kmIG
         OVkA==
X-Forwarded-Encrypted: i=1; AJvYcCV7BGQzKeXnNWR64mCNaSkL/IlJLAeN6V4j4sEZzIsKxrYKV0NLdOOwV51m6+49a9m4Z2Lc3986qHMCgQ==@vger.kernel.org, AJvYcCVFopsiKkBA1l3VbMW0ExfY48bNor1thr5xw09AwToVlArRGwnLV7m7bo3q86eKfhDCEFiwnOe53H1A@vger.kernel.org, AJvYcCXkzcWrlQbcd44wfHYGqhTR7PwTdiGUCVBAUkCdGVZpY8twDES/COif2QZSiFIY7OEcZXUmxS6EFK2aNJ/S@vger.kernel.org, AJvYcCXttuYXPOUmuoQIsMYemsUINAJp6M7dWD3NhhmZouRoFLMTEG1VE5ebAKKnIe7RwxVMl+FnFD3yfU/xBVXfjA8a@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwrhwXEc8sOdY57/QQPJy86Zmk7DvLRm/ONvhYIbOqfvAD1YW
	BVxMQ5ieQE7/nysHC4lKTnfDGHOdF1XUYb0VmBnLugZ2Xr+aRFxw
X-Google-Smtp-Source: AGHT+IHIwkihJnN8+/xwaudphadUYxaqH9MQtvinDDBDvxIYcKHSWPfNtT4/idGdG5lEnQV38bTFRA==
X-Received: by 2002:a05:6a00:124c:b0:71e:722b:ae1d with SMTP id d2e1a72fcca58-724133b687emr2662348b3a.25.1731059475013;
        Fri, 08 Nov 2024 01:51:15 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078c0b13sm3231426b3a.83.2024.11.08.01.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 01:51:14 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: aaro.koskinen@iki.fi,
	bavishimithil@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	tony@atomide.com
Subject: Re: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung Galaxy Tab 2 series
Date: Fri,  8 Nov 2024 09:51:07 +0000
Message-ID: <20241108095107.5338-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241103183636.40cc37fc@akair>
References: <20241103183636.40cc37fc@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> probably you did not notice an error in make dtbs and the old
> devicetree on the device was still there and was used.

I messed up my PowerVR tree with mainline, hence the problems. I've fixed
it now locally.

> are not the ones you need to fix, so just the diff between old and new.

Yeah, I ran the command for espresso and then panda for a comparision.
The diff is what i worked on, but I have some doubts which I'd like to ask

dts/ti/omap/omap4-samsung-espresso7.dtb: /: irled@0: 'anyOf' conditional 
	failed, one must be fixed:
        'reg' is a required property
        'ranges' is a required property
        from schema $id: http://devicetree.org/schemas/root-node.yaml# 

Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.yaml does not say
those properties to be required, is the node placed incorrectly?

/home/mighty/linux/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb:
 /: pwm@10: 'anyOf' conditional failed, one must be fixed:
        'reg' is a required property
        'ranges' is a required property
        from schema $id: http://devicetree.org/schemas/root-node.yaml#

Similarly here as well.

/home/mighty/linux/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb:
current-sense-shunt: 'io-channel-ranges' does not match any of the 
regexes: 'pinctrl-[0-9]+'
        from schema $id: 
	http://devicetree.org/schemas/iio/afe/current-sense-shunt.yaml#

I tried searching the tree for "io-channel-ranges" which has only one
example - ste-ux500-samsung-janice.dts. In that dts the node is same as
in espresso.

Best Regards,
Mithil

