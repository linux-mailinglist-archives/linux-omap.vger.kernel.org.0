Return-Path: <linux-omap+bounces-712-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83572861E1F
	for <lists+linux-omap@lfdr.de>; Fri, 23 Feb 2024 21:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B599E1C25228
	for <lists+linux-omap@lfdr.de>; Fri, 23 Feb 2024 20:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E1D14CAA2;
	Fri, 23 Feb 2024 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EN/bf0ME"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ABC823CD
	for <linux-omap@vger.kernel.org>; Fri, 23 Feb 2024 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708721282; cv=none; b=laYdrlD2MyOBRefXVWAheUK55ret97Ph7/9zvFv8Kpxv/lTQfg/eqRhnGS8qMXeOruwxGMjyIEUDy0azLLdwMqvBbH7La+GkqIUlbVaSsB8m19lBOVjM8h54FkUq7/88ZlhL+BjAuADcR1nY0HYUolEuTcIqpZtC9nlFOB/tgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708721282; c=relaxed/simple;
	bh=6Pe3mftHpbIxO1fJyf6AHXeqBVBF+S3SXbDBF0k3DhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3KMr0yyuf711434qKQD6Rqy/rFuAdNFs91gJ+LQQKhXnl71+7QEsnUCafueZGj5cZo2Z4KE6wahO/udl+yxjw/iUZU87I/EZQtGNnFNwnW5uZ7lTWvrDSJ28p13stZY/sXU/HZ8j2yxOcRqaQC3ol+VWoNzXnez4wVoHlzPJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EN/bf0ME; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so819971276.1
        for <linux-omap@vger.kernel.org>; Fri, 23 Feb 2024 12:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708721280; x=1709326080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pe3mftHpbIxO1fJyf6AHXeqBVBF+S3SXbDBF0k3DhU=;
        b=EN/bf0MElR4p8SAmUtq/zsx10naa1JUorfhqxU/m8aflv6yqGYT/6I9vTT+u84u581
         GniW7RodCez7lb4BUFZgCTeTOx4xYmpUtE6PKdr6ikM/zaW5cIfI9JIfEIzfVoS7Ui3s
         Vempw8zyh+gt3yRU1v0hsBqmK9Zom6KlJlqa2pYmPayEKe1bvX0RgZ45udK3FzJz2BOo
         dXDS9foILJ5b2P/BblA/0tjqafhIE+QIUVlrgF6rpki8hBHKlDwI0mVW9Uws8Sjc4GHS
         PigBk51Q9PxOMTIBFzJp8wejA0AmUQ2jEhtPK+9JNJr9dh2y/j+JzMy9pV3TGvwOP01z
         ejmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708721280; x=1709326080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pe3mftHpbIxO1fJyf6AHXeqBVBF+S3SXbDBF0k3DhU=;
        b=jbKZ6KK1m66QCgWuKeoh0u2Xcjc9MleLH7/N0EJaf5eOCd7duD5PWbx7xbVpdU8IMG
         72hqTZLEMn17XNvcQw3OV4+9mEZIIMvw6U1awHrXddLV9OX8bR/tbC1sfLdl11HsMMcz
         FqMjYdyt51P7EBic/wxmhKBNiv4VQPGMgxbB2kXo6xIwwaXv4UCFOvw9JwqYuaYdY951
         +qvBYJfSwg5yzDtVWRYcUrvdx+eN3wLiuxmeYDYejTrGYu3lUryDXiVr2ah/5oDHJOso
         wxykMtrZ9ngNukvqsUZFGEyTeeFM1hIy+GoKwweu49487ZP7LDh+43buBuk2e8iRQpDl
         OKkw==
X-Forwarded-Encrypted: i=1; AJvYcCVh6HXUmYE7MGNs+x0SiBePYEJLXvAInZyvL90izpqPYBt+G3spXiATsVVtYJJlGpscoQ94y0dqnILVhMQ/72Qucu2cTGtFk8X2LA==
X-Gm-Message-State: AOJu0YxKgqA3BGf5FtSC3aM0wd4sq4KpOdrNT2C1ieQ9mpEgrz05xuWG
	ZycH++VLjdvCwTUQ0PbRbimVqfWJtDYN/znTQKmnJMu4gcrn+Xf9d7Jay32kkT1sWs6vAOc596J
	rH1u1oGEBljgE9oGqzS0JL+gfUwCoGj1fywGz2A==
X-Google-Smtp-Source: AGHT+IGmkFRwYb4ij5VVoeEzcfF1Sc2dnJzwqFomuU9KqSGsoH8EJyxMrufSg4cF1JmFNOb53aFUYcG9m+OJGYejrxY=
X-Received: by 2002:a25:e804:0:b0:dcd:b034:b504 with SMTP id
 k4-20020a25e804000000b00dcdb034b504mr936331ybd.27.1708721279784; Fri, 23 Feb
 2024 12:47:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223181656.1099845-1-aaro.koskinen@iki.fi>
In-Reply-To: <20240223181656.1099845-1-aaro.koskinen@iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Feb 2024 21:47:49 +0100
Message-ID: <CACRpkdaVNhMPeeGM5QdHsgaUddixRM+-gTf8-2B-3OeLXLE5QQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP: fix USB regression on Nokia N8x0
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 7:17=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:

> GPIO chip labels are wrong for OMAP2, so the USB does not work. Fix.
>
> Fixes: 8e0285ab95a9 ("ARM/musb: omap2: Remove global GPIO numbers from TU=
SB6010")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

