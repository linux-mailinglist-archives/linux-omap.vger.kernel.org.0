Return-Path: <linux-omap+bounces-2225-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D1697DED2
	for <lists+linux-omap@lfdr.de>; Sat, 21 Sep 2024 22:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EFE4281071
	for <lists+linux-omap@lfdr.de>; Sat, 21 Sep 2024 20:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DF178C60;
	Sat, 21 Sep 2024 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V0o5SAw/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38583A268
	for <linux-omap@vger.kernel.org>; Sat, 21 Sep 2024 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726951147; cv=none; b=THG0a03g99vr8KPGYGuGQoNujvy6IXnv+cOlms72aFxKdWt62NT80y0GcGGFRgi6CtSRLmb6Xbjcq4ZnB4JpfgjyjyzOhWGuFEctzBoUeeUs1b2GIm3cJIGF/sgaRmqtgur1h9GEyN8orTnJi3ajpqEjHAlBfKa6ri7aOs0zMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726951147; c=relaxed/simple;
	bh=AyVqua7DBuP73sr6LdsAc4ij9mOlg1l35TcNGrJmYRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aXIhWEm7hE5goBAeMogo1hn7ZOHnokaoy5NeJE86MNV7B3XYnC51nubxUOPiC83ryloKpOmXvebrrXtZ2qbY73Wh2TL6nCy6yAsXOS2g/IJqvK63XlWwwYv19R7LZgd165JkRep7geODcQtxa9eh6S4aCn3u/T4luLBaX0vI2q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V0o5SAw/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso2286704b3a.3
        for <linux-omap@vger.kernel.org>; Sat, 21 Sep 2024 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726951145; x=1727555945; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyVqua7DBuP73sr6LdsAc4ij9mOlg1l35TcNGrJmYRY=;
        b=V0o5SAw/PEQNZMjdEk8TuEye1LTpwY0xhvB/HvUnKIulw6boRorqI3ILQ5kBnTyYfG
         npy3XetsHffH+ZIrRJXRzlfJCFiUmXyp/uDhqQf4wWgbQRh5uie2NeOsdQBw1iFw5mYd
         mtKBRMhCOZb1a/GmEBW+N4qem8dD791KzwDm+EbYMvAFMYtusgr9ucVW0KO6Vz+Rm6tJ
         BGppS+2xRsBFxfkUe9zDvjF17g2NztIavdMjpqKNQ6ESY96M6nDj0Av+D+nG40fBp6SX
         1YwMAGjsTuLciCIgH6HGT7SXFctUziO+Pgp0eT7Lh6ZLjEJ5LEB5/wIrXnDxuP+qcTMx
         1ZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726951145; x=1727555945;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyVqua7DBuP73sr6LdsAc4ij9mOlg1l35TcNGrJmYRY=;
        b=sbwSefPnKUWOULZJ5QrVU1ctU/5079DKPd9/thLrEUd/a6Ji+eWymCxGv1h5nKa2kE
         CDGu8ciMBHv2qTZPiQZXhNcZxMQ3NqbszRr8QsUTlsucSuGcGlQ7+clVxrJNY/N1hjDR
         95RPYcWknLeEAYY67uIKHeW5JqnClgs5jPlflRCxHPtgjqPrBN7XpfXfjjDxgF5jTgPr
         GBKIsofELhufV+JhE4QLG6+EdnOh8+8LkOybqhgeNSKlSyTodN2GXyGsJv62gE6kRgC+
         LpSM4x/nVGslaMEN6HjhnwJMQhfNYliBINguYIg//8KHDcrseDo1/963rNjP6RbwIm6I
         A3mg==
X-Forwarded-Encrypted: i=1; AJvYcCXsfGgrER7+fOuthW0FUI4fRFUVL8CXugtmidoH/FCRegPesTXPm8oE8AuvxWk8+hWVcUly8Xx8qqNN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyos5jKe0dRGK8EFjm+sNvwKLNuSg9jnMbnXT2UQsfcaY4SCChY
	ukaM0RiRiJ4fm+FMnZpCb1oTZ3E+lCCchWNEQRU7Sw861vLSNGKq0DpFv6BOC0M=
X-Google-Smtp-Source: AGHT+IGSzf1OM5od5f0nFNm51QF3jg/VW386sXVPnsQavt+rpXh6YPFhKzaO6e2KVxD1CMa8j89X5A==
X-Received: by 2002:a05:6a00:928c:b0:717:8ece:2f8b with SMTP id d2e1a72fcca58-7199ca4ccb2mr10882084b3a.17.1726951145048;
        Sat, 21 Sep 2024 13:39:05 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e5650424a8sm2546683a12.84.2024.09.21.13.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 13:39:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap
 platform
In-Reply-To: <20240915195321.1071967-1-andreas@kemnade.info>
References: <20240915195321.1071967-1-andreas@kemnade.info>
Date: Sat, 21 Sep 2024 13:39:03 -0700
Message-ID: <7hed5cpwrc.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Both used to go through Tony's branches, so lets keep things together.
> This was missed at the time when Co-Maintainers were added.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Acked-by: Kevin Hilman <khilman@baylibre.com>

