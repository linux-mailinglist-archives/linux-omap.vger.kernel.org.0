Return-Path: <linux-omap+bounces-1398-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D708CD935
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2024 19:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407D7281ECA
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2024 17:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6C43EA66;
	Thu, 23 May 2024 17:39:01 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E921362
	for <linux-omap@vger.kernel.org>; Thu, 23 May 2024 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716485941; cv=none; b=ufL4NdyqVk4fWrzHSulRJf5XAx5CJI6mX88aV+fUkgThlxc6l9XDz5f/itfMklSgbzTiDx70xQ4muqlgYbuKH7ja8OxZJQj9HeACIBAk71IoqAdGFns1TTjfp21XxmWe/FGA/DkZ4rBmAtKWRHxya71jSKnBZ8sQuNQqxvgh7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716485941; c=relaxed/simple;
	bh=ykNO24/LLYJ1KpMLjZ7s6/Y6hamJXVNHx0AD5j7rXO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TJSaTnRmoUdSnO+4g37IJhnolo2ql9cdKLG7XgkFutCd/LKyWBo/lyxy+rqNy8SErRiPzuz4pOlk2C08wOqhCIqn55KHfo46qqFQ5W1cfFJ6+8ZUzp0PpPmGGXrtLp/uIA8GoLqmYIdBwVBIxphSYJqiYWnkYGLEeVn3vBZJdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so126047235ad.1
        for <linux-omap@vger.kernel.org>; Thu, 23 May 2024 10:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716485939; x=1717090739;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/W0Vntg5VnIMxSV71l0bmPcwI99/cfB5C3Aav0qviU=;
        b=J3RK0ZZjS4THqVJeK3KUgCBTZgB2gXVwVfGhFwGT/XBItFC/BR7tBnd7tQL5BPpYZr
         1Dh79aK2U+KurgHS58HYdGs6AFS+Kiug+JUI4d4jpBaXONPtBh/gHclJoG/FxNzqfS9j
         jcmFExbo0F65JEb7Hlain3eT1l73usvW/xsULXA+cK01RAq1kGPV6nVW2WWPQQ0gwMlq
         X1ictCw4Sva/Q9PsbnpJJCENRTO1Ad3SVg9Bv22KnYSJuZKaLa8QAKcnTk+C2QGdw7wG
         9yymB5EvrITEjxeL09Whgvz5Pe1c6ml0FE+Ut4qnvj65K38EhEFhAZr31cIXf+CoecHu
         JzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2xJSRmSXvB6uW78OpxWHuJJ/11zSOsFd71yLmU+AqHA5aanYt+jPuZU56choaEKVDOtzYgzYGZuORv2TUVxdB37wxmB342av4Mw==
X-Gm-Message-State: AOJu0YxWLqbLAF8zfrLyC6IMf4g6DgB8igN1wIbrWmFR2J2rDjNtIbh1
	V2Kj5kwPkg7Cb0+9AAQZEMlyJjrzMo4aulwKssYtnDOkKF/JOse2OT37GicZ+Zo=
X-Google-Smtp-Source: AGHT+IGNADe/wyzsEZ266Ywm0cLtpbI9AmZBl0HV71wuiRh6eLHpIL1UEb3u967JpeQEc6fSHcuJww==
X-Received: by 2002:a17:903:228a:b0:1f3:1482:60d with SMTP id d9443c01a7336-1f449901aa6mr6505ad.61.1716485938797;
        Thu, 23 May 2024 10:38:58 -0700 (PDT)
Received: from localhost (75-172-111-169.tukw.qwest.net. [75.172.111.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f30358e6d2sm71520115ad.93.2024.05.23.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 10:38:58 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org,
 soc@kernel.org, Antoine Tenart <atenart@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Benoit Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH 1/2] ti: omap: MAINTAINERS: move =?utf-8?Q?Beno=C3=AEt?=
 Cousson to CREDITS
In-Reply-To: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
References: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
Date: Thu, 23 May 2024 10:38:57 -0700
Message-ID: <7httio2zta.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Last email from Beno=C3=AEt Cousson was in 2014 [1], so remove him from
> maintainers of the TI OMAP platform.  Stale maintainer entries hide
> information whether subsystem needs help, has a bus-factor or is even
> orphaned.
>
> Beno=C3=AEt Cousson, thank you for TI OMAP contributions and maintenance.

Not sure why Beno=C3=AEt is not cc'd, so adding him now so he can ack.

Kevin

