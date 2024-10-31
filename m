Return-Path: <linux-omap+bounces-2555-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DEA9B78F7
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 11:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790231C24220
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 10:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64772199EB0;
	Thu, 31 Oct 2024 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TntjoUqJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A718593C;
	Thu, 31 Oct 2024 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371628; cv=none; b=Lv/lfmtloXmowpT3CWEGgMHc6L8qsrd76Ak4g+Ge8QFVj9CAiUYHYtnQIHCI006uJouVbOYCH4/H3ubuZBESnwTxOnLIkP4AGMwgaV0JV3oH5f/ANG3KzT5bBdgXY0+zcVZYwcisEdoWy5Km6CSSn8ZAyUxjcfDYUuIj6oycpVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371628; c=relaxed/simple;
	bh=2MRXlISGofpJy6zOhWH0qDgXeEfKav+2/JB+H24ewGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=so6EnnMCDv1bFvHC8IIei9cCNuUJWGWxRgLcq8iFuzmGBdwANnbG6Ke+BNVg9vBU10QZEsZBlgy9ev6LbsYDapiPq9jnVb7DgIA4WHgkb8641BIXYckt9dZ2GIlxDM5kEu29xhTzPzog2Da/yT0M9IVhK4IjJ74CtHG/pCjADtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TntjoUqJ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ee386ce3dfso945374a12.1;
        Thu, 31 Oct 2024 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730371625; x=1730976425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MRXlISGofpJy6zOhWH0qDgXeEfKav+2/JB+H24ewGY=;
        b=TntjoUqJZVU/V4Qj33IDDgfl0KS0W1UMZ+FS3VmnIylKLXY0ltAd5PyDWf2o6UZJQL
         xpoo//29WjZAg0FJE/JGaCKT49FO0KsR7tcuC/1m89Ob5NAObrR4/xbzWuWKSWGEMVyu
         OxXp/no6HZCNlVHRJNHS5WsNinXFIZj+0fAfYmjBxwr9JivLiJDwUfqVyvn2hyTVmdah
         XJYuJBsSQlayshU8BA8FthSkPJDqStLmXAflukMlXg7iYzfkD0fy0cII1qeboSNp2lPj
         wTdBNxL6/KUOxVbDFQOuLRcLlGdqXslBzyxLAOmLnxL0h1/a0uJydjZjJnZIHqdKHKcL
         KVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371625; x=1730976425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MRXlISGofpJy6zOhWH0qDgXeEfKav+2/JB+H24ewGY=;
        b=DOR0N6c8f5tvzMRFmc24kWXMWRo1xnniT8qmKyCbn26xReBKwrnQM6CEkF9jvDWv8t
         6vsJnK0ZXXLe7mKRxe+rtrfTRnvkS5uocTLaYkgGug/Oez2lIKW3M8UOtUgqrv/Iu0yw
         m63jAdOUryMMDKrvT+197ODTNlWFaleEUT7i1DY8ek4Q1fliOmP+wQQua+zTdV5RcUNm
         g9CQ9qx1K2JnIA19xzqA7xGiJoIUcTz+OuVNT+T/aIrNBxumsXEVUDH4zQRe7p90cVGN
         OwhBCMRQnUkgsLFiapcY7BdnlnDmO3UUMmI/8mu1ACm5AregKbrUgQwAtXNjTIn3VCDT
         tCow==
X-Forwarded-Encrypted: i=1; AJvYcCU84faoaYSEzvwIu7/S8daEyVaDzkfYkbnioKPzqKIcQbtkqSg8ROen1yC/tux2pBXgj8aCB87phalQAWpQ@vger.kernel.org, AJvYcCUJjqEreKPmWo3wbF9H7FRH84kxecL1ocDj6GcWCAYNRd8Wbn2K4Cbe4c8Az7aSwWJDDD5SQSugt87B2it9xmEq@vger.kernel.org, AJvYcCVo8V9FViIAX+JX0Im2EgE0N5BpACi+CtCQDvFc/CnqFvOt1L+V6DlDSTk8+bRCnoPW9VU4v14GyLs0@vger.kernel.org, AJvYcCWEJQ0LlukVRb49+EIb2giIgWlCtSRr2bgFyqxeVkdesItaeF7TLZ5dWl/JgjhESN2IG8SkE5KZFCohAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNhl7bGjrePfry1bFNNsUZ7Er+QYFP9jxGClnc9Lx8/7XFnzh
	bnomhqwJb4PIAhnznOJF9OR8MlBmUQR//bmiNzlSiPHhklZkYYoc
X-Google-Smtp-Source: AGHT+IHZV6eC22Bo2eCDMSor9E97BFyEdYp1eJ4AZtfisxfZOZWlRXG1K3+CB5e0rWgTxFoZq056BQ==
X-Received: by 2002:a17:90b:38c6:b0:2d8:3f7a:edf2 with SMTP id 98e67ed59e1d1-2e93e0407bcmr2867863a91.12.1730371625623;
        Thu, 31 Oct 2024 03:47:05 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45a12337sm822291a12.91.2024.10.31.03.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:47:05 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: krzk@kernel.org
Cc: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
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
Subject: Re: [PATCH v2 3/6] dt-bindings: omap: Add Samaung Galaxy Tab 2 7.0
Date: Thu, 31 Oct 2024 10:46:57 +0000
Message-ID: <20241031104657.5016-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b3d51c31-3bcc-4319-8857-e16ddb636328@kernel.org>
References: <b3d51c31-3bcc-4319-8857-e16ddb636328@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> It's not attached to this thread. I don't have it in my mailbox. Neither
> did b4 when applying entire thread for review. Sending something
> separately or making it not accessible for review means it does not
> exist.

I am not sure why was sent seperately, I'm trying to learn this workflow
so it may have been a ametuer mistake from my side, apologies for that.
I have notes the changes you requested and will try to apply them in v3
along with others mentioned.

Thanks a lot for your patience.

Best Regards,
Mithil

