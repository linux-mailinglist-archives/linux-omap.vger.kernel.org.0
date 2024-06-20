Return-Path: <linux-omap+bounces-1572-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FE911460
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 23:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5491C21886
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 21:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0891A80055;
	Thu, 20 Jun 2024 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Plwywuxz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751842AA0;
	Thu, 20 Jun 2024 21:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918579; cv=none; b=VaKc9eZG4ZfzupXKJ2hCKWuwBUPCVCstChD3eaLxQclcYg4wA3LDkB3ltF1hatrhXCA7j/h8OdLhekPFl477sn2v4+MFn0K+CHNxG/MeNI8DZ/xacC/Pe5xUkLv4jq85BdE5J95Kge6bxLpifOtKemoNA32zNm5Fn962shnfzxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918579; c=relaxed/simple;
	bh=GDgGkg0Yj2EE5vJkYyer4j+Q1CG8W74PJRFZHyebJN4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bklmkLjdpXWZWl23klC+uS6g1lqDnLCqIpkfgot3v1wUCjQvhx2rm9aQZlIXelalY0LLecb9CELId9iSNQkyXGgm0/zBRqK/FIBscNKHUNPgq4eGG77b6nQRdZwbj1RhiCdS20Pwjb8dMM4NjwGl5OvRM8bmTNcYkc5h5j4xLKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Plwywuxz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c9034860dso1695228e87.2;
        Thu, 20 Jun 2024 14:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718918575; x=1719523375; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPwwtH//0wnbpjFYmpeK+hM9/Cx6E9LC6hzzO3I99Z0=;
        b=PlwywuxzEFri+VUNIVWhrM3srx7y8h9Bc+G2ZGFeY5QouDrVde+gHawBVh0roGGKlO
         bj0bDOGCXh6Xillo5hGrG4FN1BEjfKog+zlD+RjWP+SdqSjMsq5i9fHdvBweBngByoAX
         SChkLN7AYNHkiO7rMNRJSV2pjSmfoXr6x/payFxb/md1BsF4zula7x7N7F3LPuel5o6I
         4Q2I4q4eBgZ98ZKT8EKJyJbdeqivmffYlaKyLdzNsvcm2GSL6A7uFQrwY4UnX1gW2ECf
         m4Hg3PwLwnsy8LYT6FfRT0wEAVZ3cOtERoPxm1+L8L2g6bvPCbHCI6swMhS0d8mbT3+g
         yupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718918575; x=1719523375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPwwtH//0wnbpjFYmpeK+hM9/Cx6E9LC6hzzO3I99Z0=;
        b=SDjEhw2OW319JqsdPwal9fvjcz8MWLVB6aF6lvtWxf+0sWzTj1NzZw6GTZGU+28H2v
         Az4ZGAc0ULZf8eeCE316DEyDFoitaRLCQpyn78up1/n6JXN/SMomsQ+DFrYH1VsVhLV9
         ENgh42hAVBc0GT84sms2POL8xlynHA25p1vhbB9XrqHbfJ2YJ5892VWOkFY5n+CGmdEf
         Bwju30AHXe1KqSuZLdP6Yk+EpTURGfbn9QlVja9juztz5Ko7V4Xz5CKKfSwOjUWbA0yf
         IDH5hmf6UBe13PimmhaGopnwmpxgMT5PiicrjASx7hzvsNI5MJTwh7L9MQGk1oZiYoQJ
         +Mkg==
X-Forwarded-Encrypted: i=1; AJvYcCXtbur6IJ4ZF/qPFKlpQ/yEsq/GRgLehkObi/ZRU3CfOQNPprp7r1YjPkKthUUji9LB/5MSprrBKcNp+HfD8pZRi0lyBKM/AMjTyEqCmAZv4YUph34QWRbRf2cuON7yaeFeTJX7XNJCseKS+hTW
X-Gm-Message-State: AOJu0YzqKC6TqjeUUVg+U/WpXBEMH2Ipb6um7vsU9HDC/XBODA+y70JR
	vi5sIeq9CZAhA/ScxQbvhidrh5uIjVTbikVwthH6Tk82oSoWTS69zOcbdMYj
X-Google-Smtp-Source: AGHT+IEhHE0DBIWuyi2NQmDBurFByj1XamWxMXXorNUJtZVekzIzBKu3wk6+7MK7XBCfrVepsvVdZw==
X-Received: by 2002:a05:6512:3046:b0:52c:84ac:8fa2 with SMTP id 2adb3069b0e04-52ccaa2a9aamr5773385e87.7.1718918574711;
        Thu, 20 Jun 2024 14:22:54 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560d82sm10922666b.172.2024.06.20.14.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:22:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] mfd: omap-usb-tll: annotate struct usbtll_omap with
 __counted_by
Date: Thu, 20 Jun 2024 23:22:32 +0200
Message-Id: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJiddGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMD3fzcxALd0uIk3ZKcHN3k/NK8ktSU+KRK3cTEZFPzZENzYwNDCyW
 g7oKi1LTMCrDJ0bG1tQAPZnBjaQAAAA==
To: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718918573; l=777;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GDgGkg0Yj2EE5vJkYyer4j+Q1CG8W74PJRFZHyebJN4=;
 b=0+KFrVh9sPHFnxp0hq8y/1fersFd19kZUHxlWxvjzxytVBK5u1BfdzAo5dtRopTsKK8PK6G9j
 bpzAjUOTkkHAaBYZszI57SGQ8wZBEgsZs69ead+2/p/9kJCuIzaFXfN
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The first patch carries out a straightforward annotation, given that the
number of channels is initialized before any reference to the flexible
array.

I might need some feedback on the second patch. I added a comment
regarding the issue to provide clarification.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      mfd: omap-usb-tll: annotate struct usbtll_omap with __counted_by
      mfd: omap-usb-tll: use struct_size to allocate tll

 drivers/mfd/omap-usb-tll.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
---
base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
change-id: 20240620-omap-usb-tll-counted_by-aac57c173018

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


