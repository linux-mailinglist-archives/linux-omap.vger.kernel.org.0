Return-Path: <linux-omap+bounces-4589-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8CFB4669A
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8134B1CC1B4D
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6C0293C4E;
	Fri,  5 Sep 2025 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="22LhNmKX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49028C011
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110938; cv=none; b=EzpLZD3Et7Dk73oIRwQJ8A20sk84SMQvefjGjmPcIIqUIiW83KIyKk9yHSF1ZebwIKXBppvARXcBpkBRFsQm2shUXRE/7o4P5AHwQMp4g5AShpON+QqmtNg2fEfw2G1nHAxk6eYPpcxaidOGHys8vR8+SVLrfIAoIvc+lljv9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110938; c=relaxed/simple;
	bh=q4x9gU5XisbXR7MWXrQ3Kn8NypkdsrYkmqq2J33ZMO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rFQFRx05pl8loK3ItNyTO5VRjMfMV/snpInsU31tx/Bcz4LvLc1r5E51GGCRLfmeDV6ARs2rrPlkZdrh/NnQA0def69Hmww0eLWsgkZ6PSr5QDhfPGAjDikfgP3LK/2H8IMsiQh4LAwbTm3zw4TIVfeqltidTAWLEFGAWmtHG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=22LhNmKX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2445805aa2eso26221455ad.1
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110936; x=1757715736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBGiXTRWAGjYBGB86C8dW2qAaRD4gUKSDgviMv2oSII=;
        b=22LhNmKX/yoK/r+kRJ3+XwRQrcd5ngG/3A4ijAVvy6Ytf5X452sqUoQBj87pC5QogU
         S0VhUGVRGK3gD/cJ2hPfeU+Nn7599qfvrviinWAf+RnFAXJd3W1L3wyDgkgPizmh8DNO
         5SLtRrT0JxW1Hxyw1aJIXssL68jaZvfrMgI4Z8WDq7UAnjxm1JiLlbx6X72g9BrOGA4a
         zn/IPqlV63JoxohQdLIvpzp54Tvju/o88tdAMulSInkL5f6y9HJTQYZcPkzHsi+lpcyM
         b9hK9V4Fxm/iByn5dPMiyPEBtybrGVTuqpmeUvI+mpyfeaJOZvQJFsKQl7+q8soEYFul
         QBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110936; x=1757715736;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBGiXTRWAGjYBGB86C8dW2qAaRD4gUKSDgviMv2oSII=;
        b=fGAM506KOekwKxISbrcUCZWCFBFQ6eid9jIVqIZp/4WSIDjpysBV1uaL3/9y6QxTYF
         GQSIW5ltOY1fGiekLTezPeeeY53pf3a2O/P5ugE359CG3x2JurAc0MVXIj3FtjCxtBJ2
         DA3X/mS/d4l8cBUhnYWmA1F5/cpsLFIoMtQfYThicFi7rIclMWCCnfXLJxJmLaMgFKu4
         YOtXLrPzBlmxcbD9hp5NTDXz3ldjuvuTdVwY4HGgCfGST+nhEhgnFmgiCH4ohPJJkDsH
         cejA9nMhf3HXqNvs/R2tk+2O713gJM7RkFtqz4C2RGvM4Y6YO/uNkOMSoG9TErBYM9GM
         8czw==
X-Forwarded-Encrypted: i=1; AJvYcCXBYyCdVyQjyu/rxOSGu3jmSTS/kgLOdrkel4qqgjiKoz7xLGLTLcXOs6OwxDefL5AnOU1xrqcWm+ig@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+MHj0nKYs12p0O0kIQsDht4aeuFpL1k6f8XkLcUqI17U6VQpL
	T2Ep9PNVIAMh8HQldOwXjIKVXFbhBFEGCnr0B/7uF/5YYoYnlPsJlmdMeLhTB1N8mDc=
X-Gm-Gg: ASbGnctxelh3jWZj0iiGkmhocTKpYMqaf+8hf9EyG+O1bzDXxp81ZXX/dX/1oEShjJd
	N/FwcOVC05mz/KUDiyX6xu2Y2+QB9jAT93UJtVIrhp15IqD4qXrhvPzjEx4fGRlsAmbKJ4CnAqf
	WnUiCtqxVPmUkty6pIGgwCindjQ7wrOTBqG2QN42PtI1Qm7Nx4J3S2L16akYpwg1f9KO9wm6ENN
	OFsIciaXs2ZiQDMHW/hpF9Pfg8eqB2LYIlZrMDlQlhsaBOgVULyM2CvSnDd15DQUPm7BMTKqaB4
	jeVS0ppj3aL+vbyXTCCV+bHVmlG8QPkDJJqHbJiPGAvtqWG9xrBJyQoo38ul4udyyvW4Rf/C4dd
	kuY7tJaxh2XJoeZ6LE0RB6g2kPzNMohE=
X-Google-Smtp-Source: AGHT+IFE05TJtfqGSyHWnJAp1HNp9W7FNnnwA+jbOsFE8Rf8W520wf12+dz2Te7dKhBHic9rRWcDWA==
X-Received: by 2002:a17:902:dacf:b0:250:a6ae:f4cd with SMTP id d9443c01a7336-25174c1a971mr2867455ad.44.1757110936014;
        Fri, 05 Sep 2025 15:22:16 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b14e1b097sm110499695ad.21.2025.09.05.15.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:15 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org
In-Reply-To: <20250822222530.113520-1-jihed.chaibi.dev@gmail.com>
References: <20250822222530.113520-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: am335x-baltos: Fix
 ti,en-ck32k-xtal property in DTS to use correct boolean syntax
Message-Id: <175711093513.666031.18135228669167413302.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:15 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Sat, 23 Aug 2025 00:25:30 +0200, Jihed Chaibi wrote:
> The ti,en-ck32k-xtal property, defined as a boolean in the Device Tree
> schema, was incorrectly assigned a value (<1>) in the DTS file, causing
> a validation error: "size (4) error for type flag". The driver uses
> of_property_read_bool(), expecting a boolean. Remove the value to fix
> the dtbs_check error.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal property in DTS to use correct boolean syntax
      commit: 9658a92fad1889ff92fa4bd668cd61052687245a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


