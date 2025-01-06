Return-Path: <linux-omap+bounces-2998-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E7DA03230
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 22:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3C393A06E4
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 21:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130821E00A7;
	Mon,  6 Jan 2025 21:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny8lA3DK"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9FF14037F;
	Mon,  6 Jan 2025 21:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199462; cv=none; b=qwh0NDi5+d7g539emkrfZpDBoPuBv05sfHr3YwU4JXKEA9/hmtZY+M93O2lXEgOVaS1ACHthpeNA/MTzY7Fz7jgOk1e+PETyWupPXM9pxM6kbWkYjNGHDR5KkCNwJazENnRwZh0I1nsABYEHLd+uVGVijBlzZHvVUiLUia6XHW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199462; c=relaxed/simple;
	bh=9m5H7kHPonfyhNQR1nj0UWrPDbjY8rdBq281JPurRt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OH44ozZYsqTDBrmIsBQ8RNJfmJP+ANVXYNmpaVtu+VOGmySkcPNxu39GpkyYqkMs5FlBVkQbYFXmZNEiGxwj6G7juSoPcDS6RelKfTXjnwU4QX/Vym9Iy4iUuyJ1tA65pHNN9ESRMcsIXackrnrCo9BfU/k3qLVvjDD/3SXwZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny8lA3DK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37908C4CEE2;
	Mon,  6 Jan 2025 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736199462;
	bh=9m5H7kHPonfyhNQR1nj0UWrPDbjY8rdBq281JPurRt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ny8lA3DKLz5m/sfuvW1s4T5bpt968r6fBu8DuZu+CenDyfjY+tuysThVPphKwF2WP
	 OuDvOkbWSmw1bowLu4LrNMUHfpKZGRXfCSOhGVErUxdQZPzkGhHMnyQwLQfzbkYTc7
	 3ezvYsXOHNAAOHGC2hqunyXMuDFDr2Oeb4nVCscVJMrmOJZLeZFJMU5rwn2knMBClu
	 d0pcnZomqO6jN9vdX5kJriLfPaHgZeJ3ESCBhUkNeHAg9JlBXLrnB9FosyDzut9vba
	 e9Waw0JusEB35+kk5UKN5tgeFFoj1KrDIi/9bO8XRpizwYTCk0ESZOcrJC+Lbu22O4
	 bjHsZ64nbh4hg==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e479e529ebcso19400276276.3;
        Mon, 06 Jan 2025 13:37:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2G6Y/PhQd0yigx8IbBH15idoXNlYpbyDQDI9mu87D0VDFqoJGXSZHScKT46VMn18s/T5/enXXHPuq@vger.kernel.org, AJvYcCVQU5jp+4H27GlY0KrafL8IA83H/vfrA8tEF6NslxczLHQZOEQJ1FjsZyjwIfNzXcImVAdQ5NwszTjYlA==@vger.kernel.org, AJvYcCXW0mM3Aoxv7LPqFg+WPbLLn9LwPTgpXOcf7tDiBHK+ARsov7Kc5LeYcPCxVwx6nS6R23+xb5PWKplowco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzieyA8tarSUt8E6JLKxs0p9RtGIFJbjpqwkW2g/dabpFC7JmwU
	26VQFPGHqgHgFKw73mfvMoIinFDAV95YplaOxmZ9lqHgQtvN82HoRxceCUFN/XdkkPPmPXtzNdp
	rGZmZ4YJqM7TtoJsVTjej+X9xdw==
X-Google-Smtp-Source: AGHT+IHyfDhHyQI1uWGW6OOcFTI1AZDalabc00kYdV2rtjVeVq48AsaKNzKuxGmzfdpyrPWISkI4n3ztkPVzMi6Btec=
X-Received: by 2002:a05:690c:6107:b0:6ef:97a2:49e6 with SMTP id
 00721157ae682-6f3f820cd0cmr484407147b3.31.1736199461441; Mon, 06 Jan 2025
 13:37:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231164456.262581-1-robh@kernel.org> <c6925d52-d662-42b3-8ca6-f238c77736a4@sirena.org.uk>
In-Reply-To: <c6925d52-d662-42b3-8ca6-f238c77736a4@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Mon, 6 Jan 2025 15:37:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKXJEVQuDqp1amkYHDrfKdx0w25bonKLhZh9UPjA97-3Q@mail.gmail.com>
Message-ID: <CAL_JsqKXJEVQuDqp1amkYHDrfKdx0w25bonKLhZh9UPjA97-3Q@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: omap: Use devm_regulator_get_optional()
To: Mark Brown <broonie@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 6:49=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Dec 31, 2024 at 10:44:56AM -0600, Rob Herring (Arm) wrote:
> > The 'vbus-supply' regulator is optional, so use
> > devm_regulator_get_optional() instead of checking for property presence
> > first.
>
> Is it actually optional?  The name suggests it's likely to be
> required...

That's what the binding says. From a quick scan, I only see this used
for OMAP5. The preference is for this to be in the connector node as
that is where Vbus is hooked up to typically.

Rob

