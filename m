Return-Path: <linux-omap+bounces-2574-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968719BBDA0
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 20:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5966A283306
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 19:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB1D1CB9F1;
	Mon,  4 Nov 2024 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0TOekSQi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2831CB9E5
	for <linux-omap@vger.kernel.org>; Mon,  4 Nov 2024 19:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747030; cv=none; b=UWqhDjYvbdoqSojX+X3APEDCKZsP5xrPJ/uiO/ETar/YmA3IQSFenIXfZRmcQUKlD8WpWIVy+7EDfV7V/GbjW9JwYk2zi04j+s9NYJoe1z7F2Kgx63t5rqsDH4S0ifHLDmUiNH/F0Nknvi//ipNqJk4FnL0ovpfaOfc+ewYT8Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747030; c=relaxed/simple;
	bh=XvdhWma09IaLleTvj56ROWEfmVpcN86+tOqmtSMn5Qo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QqJ/ubaQ1tNS/S/8KOJ8fI9jwgSFsNv8l/MPQd2Xf8UONlmej7YgVl9FikQorEDaUE6vGXxR3+qFGtgYTcqwzwb2Yzc/SkWubKWs8YBdWXEPHsJYmqhDVL90/8zFMST0a6dzAIbFYymEPprNGBltszeCdyO9mjhbutR3KBrhch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0TOekSQi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c77459558so38780595ad.0
        for <linux-omap@vger.kernel.org>; Mon, 04 Nov 2024 11:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730747027; x=1731351827; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NA8fP/yMJX4YrX/4tkNWkXd8CoB5Q4SliEG8XZe06KY=;
        b=0TOekSQi74T0YPadsPM6/hVJ+B/y3xVI12FCGCXr4u+Jvxg2UhpGhnozIieY9xD2zi
         LRxzpW9RfGm+bUqhv+OoXoq71YAjT1ArLGP4TNnSOWokYN4Jv3N+2C2Do0Kf72tSYwX4
         m64iGd4N582KpCRrQIOIPQiTzBXieJoUk9HCg8RoEgTXWB7Ld4ikSma47yMq1N9mbshW
         rbm1t+MpTDMkEJCYPLTniG256U9Fogf6ksR+/fyOecACeeWvHibmles7pjju/TlyhTfo
         DAO3qDwBn5a8FmBe8REahYsm0xNV4VLMu0RHDVSnWCuI3Sl52SW2peat5/hNgy53pxIy
         eL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747027; x=1731351827;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NA8fP/yMJX4YrX/4tkNWkXd8CoB5Q4SliEG8XZe06KY=;
        b=IPmD/ucqO1vPj+xi3oJZAxY88RqT51AbGoD3mx1NCUQ/2hyZJHB0MW040o/4B47VR9
         0Q86Aeqy4ZxnuUEDtYiLPcsu5ndeowk5xIUGZpA6aPPJS59HsCDL4SC2ArgWgc7x2tD6
         0mZ/PWGP269mLgV6UtWxC2CA0C8uj+5+OAy8CNg7Tba64L/4nQCGk5TCFa/CiJsd1SPB
         I+KWO9yYpnFaHpkopfO2fvPd6maSgVoPOUHXSmmIat2zPPv6FzjcLj5xCus2458vKemU
         MBnAS6SMYt7FTgcNS9KhMJPBNEv6wLDXJIyPfNnDro9Cqm5PhbLUyjOMYcpHDayZFRbg
         6Eag==
X-Gm-Message-State: AOJu0YzNsJSMK6282i4QM7qL8ZaGPwyPLvDzcRAgZmc+bR4wMJrxGap6
	5kL6h/65Hyv/FVVemwgUDyw6zaMK917VyNQkDXo3bkpaV8JonphSGuWqmXjf3ig=
X-Google-Smtp-Source: AGHT+IHCn+jwQGkArcOzaPbcwgPSYj2Q9cK06QQu8ytXtnA4Uxk3VIEJ5QKuxauHvt2qnIwQYyPqwg==
X-Received: by 2002:a17:902:cf12:b0:20d:2e83:6995 with SMTP id d9443c01a7336-210f76d6750mr286890785ad.47.1730747027167;
        Mon, 04 Nov 2024 11:03:47 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211318b562fsm41688915ad.169.2024.11.04.11.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:03:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: dts: OMAP updates for v6.13
In-Reply-To: <7hmsieomrt.fsf@baylibre.com>
References: <7hmsieomrt.fsf@baylibre.com>
Date: Mon, 04 Nov 2024 11:03:46 -0800
Message-ID: <7hikt2om7h.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed
>
> for you to fetch changes up to 13746595a1581e09289adf9b5202e237c5e0814b:
>
>   ARM: dts: omap4-kc1: fix twl6030 power node (2024-11-04 10:42:22 -0800)

Oops, ignore this one.  I got an email from linux-next that one of these
patches is missing an SoB.  Will fixup and resend.

I deleted this tag to avoid pulling the wrong one.

Kevin

