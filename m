Return-Path: <linux-omap+bounces-3099-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFFA0B956
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 15:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4062D3A262C
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 14:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383A023ED75;
	Mon, 13 Jan 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0w7TXha"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C26A235BFC
	for <linux-omap@vger.kernel.org>; Mon, 13 Jan 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778148; cv=none; b=oxNjz1F0AtzQFQxgVbAGxeyU6J9AMkxIJ89UlcFaV+rjIvzx5+XgteOyNbB513JMySAybFM2J/vF8TpZ03ufuEkAUzv6Uzg+U1XmkAHvZnAalCzwP9L6pWwOEe7bcz3xY4EEqRaakikZIoeROUPVYl7tcfxCns2vMhQWqTmBYEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778148; c=relaxed/simple;
	bh=hVM6Q6nl2z8cXwAn+C0EVV/4XZBLyo2kPcFo1oLs52M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8zPYN9onVO2wmWxIJPJ8/9zoPo8KZSa+BJfA3t2ImhrUvivPk8jLQqrMiDRRs+EUyTyFh0vImukUiuAGYIwETNFcBKmSwQ0PCLDA+f0royutypQMIeCyTx+iyLBYqU/3Dsgrq2ZXXdYZkEghkFqGFft5QquMFqO1IPOYJXhvPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l0w7TXha; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso39829521fa.0
        for <linux-omap@vger.kernel.org>; Mon, 13 Jan 2025 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778144; x=1737382944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVM6Q6nl2z8cXwAn+C0EVV/4XZBLyo2kPcFo1oLs52M=;
        b=l0w7TXhaa8QL3ybpFYu/gIbRQ3FnFPB2YmSIf2Bi47P3KzJdxN8LZwCHNX0ZawYLIh
         TQaDsQsvkQG0DsXyyr1KQEUx44yUI1moPwy4+cvbg5iSUBx6yFe0/ySzQ6Eb4780wqTn
         l4KmtdRzjT0qrZ+z0bDJPPeW2fgeGyTTTlKk50hXVxGecfVbwlWRk6QBsFVIdjk9kAx5
         pjUGX9g4gjpfUKYFQnbk3mHcSdYilYacFjpfH2gekCW0MdWzsewLkBhIrufc2+9ARZnc
         0FdGQzrkID9fsi6cHKSSMdWxPOCFIpHLJxn/Icahlm6F4BkNctB309oXCh/dGw8Yow7S
         d0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778144; x=1737382944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVM6Q6nl2z8cXwAn+C0EVV/4XZBLyo2kPcFo1oLs52M=;
        b=jboqXggZkHfXGdXS6RvlY82uh8lWaLxqZtIk0CzrSPsLRcWz6fx1kV8SGChOTpww5x
         Ki88tRflGNFF9VqVTDhf/2zW0Pj5B/937hGja6HOhyB0nxMaahAW5oX7vHIsPWgT69Dm
         GsH2F5/fNH/JD9/td03mGk7INu7mPrfCi8un/NrrUcIZOYS1RL9BT2+Oerznt9+J25PX
         /obekcvNdie3hHkR8DP97HQywz7aVwbNY/KuCtKeitq23gp+N0Idb3aOsjzdlySiqrAO
         FFDLfY2q9WFCOj52RWEWug475kHzCDZdLdcMieuJJzx8YI6ymqw/9vEc1OKKFUYXHYvm
         Zfiw==
X-Forwarded-Encrypted: i=1; AJvYcCVY+OWaSvamwsTKr153xJ8axM0rGv+HM5Ickj7kAsiZH35cs2ykHF4fWawzR2AaieHmBNkKfdgHuBRw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7KkSkgH8qkjtfjXrfJsRN2AZ04usc+BljmiXIAgFFu8HBXFV
	pOM6i9+vb6GDpiFDKMzMddeHDADkuFomkXhqzAO3jk2s/1yi4oMUfdmL/dy3aOa7niFa+d0+fQv
	iYddrGA3aCf6I/JlZLZKniDYHcNQZ91ro0Kev7A==
X-Gm-Gg: ASbGncurLyG2LFfbLDWX6jtVWKnZHr8ZhrrjjeIbyw0nCOUmQXarViwdcisJRuFVU+X
	FlxOm3gFPXZ3QPaDZ8jHgMr+hNpzmUmX/PuoK
X-Google-Smtp-Source: AGHT+IGrIp/YeFWUqkZp4mq1epwojwJuO2MFV6BwKUJrwVosj2W4wO5hjnuQkHxGYcHx/sm+Sao3K5qAIcHXELaE4mc=
X-Received: by 2002:a05:651c:a0b:b0:302:40ec:a1b3 with SMTP id
 38308e7fff4ca-305f45a0a29mr66505751fa.21.1736778144142; Mon, 13 Jan 2025
 06:22:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226215858.397054-1-s-ramamoorthy@ti.com> <20241226215858.397054-3-s-ramamoorthy@ti.com>
In-Reply-To: <20241226215858.397054-3-s-ramamoorthy@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:22:13 +0100
X-Gm-Features: AbW1kvZw-J9T2lbOIdvQTsvnzzUUNu5FkxOd4XaIzoaWKdeSjEblgmM_5TWT_0M
Message-ID: <CACRpkdaszNc-wLj7eztFhhsZi=K3bUqSN=m-ET4sdVdi6ufM7w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: tps65215: Update GPIO0_IDX macro prefix
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, brgl@bgdev.pl, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 10:59=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:

> Updating the macro name to TPS6521X_GPIO0_IDX is meant to indicate this
> macro applies to both PMIC devices.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

