Return-Path: <linux-omap+bounces-5090-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FADC9787C
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 14:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 94C154E3DFA
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 13:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F9331159C;
	Mon,  1 Dec 2025 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsD7tLW/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB233101CD
	for <linux-omap@vger.kernel.org>; Mon,  1 Dec 2025 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594805; cv=none; b=uHVO/Yz22P17DI2FOE2sijzYszqFxjD8OFb0AsVby1AD4KyXCurubmLXTJgNUL9ryTLd+NEpGa3ozqcWO0A4+m3I2kl+soHxyWMnnufB0dlUh/xaqoYYZFqU6g6gsid2pqnicJp7GM3IKo8lhTrveExMPlis6N7bL8eDtEsZpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594805; c=relaxed/simple;
	bh=KvS/c5+sVLM1HjWDkIWCltG0ZGZDRBAXr+tIihk2rlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufFKHKzFyBFag4mxl4dpEpWVv54Vmt0MeHNgtCQOxYu93ZCo8c8M+VQ7BSDhwnHtOdi+rLKpTgMhIEAtdRntk5Go9wJB4PwwQGnjnMirkaZvQIDIT+NvKjgYiaaylYrgPPK5nC9YyJrtiZCCXuOAaXzZyrsVdvkEL8KZVXarXO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsD7tLW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28434C116D0
	for <linux-omap@vger.kernel.org>; Mon,  1 Dec 2025 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764594805;
	bh=KvS/c5+sVLM1HjWDkIWCltG0ZGZDRBAXr+tIihk2rlk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GsD7tLW/9W6f5CYDc1D2cA/kGkAg2cx0nhyCW5vYfs1pj8/bBRPGB9OgSIRsma/jp
	 4clFj6lKhRaGAf5zwQm4ZkCqS9GHTqyy2s2TXI3EiwLfxt0YzcmhKbytPpMAnuiGsQ
	 wEYu/qlNonipsMUtMVhT38bZeo9rVaDPVB8kdy4hzX6Xz+0nZ1fkGpLpzp9Rx3dO2y
	 L/aQHBYOzMxYhZahAhI0uO+baSpw9lMtTe3zy3FgU10ooTB/LePMBJ3CszvbBiW0nf
	 89m4LO0cnygpmZXUmQRFD2eoE3418phufq6Kex/YzMVCYHSb/2FwC/RP9GZSrE3HBw
	 QegB0QjZCNDog==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso6327087a12.3
        for <linux-omap@vger.kernel.org>; Mon, 01 Dec 2025 05:13:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWnQSRItOkFvQlOTRFLk8hFH9G1/4yk1MpDwKRDM2IQzzSmypgy5TFJ5QOq8/D4QOp1fAMOJs0S18O@vger.kernel.org
X-Gm-Message-State: AOJu0YywO7w9j+t/VmRJ+0pN2FUE+TojCZ6JzUKqDwgwBpKja9DLq9L5
	WWPJR9aZsOMKnJ1FArPQmNnMxb4S3YLSw5G0lKmfZbNORlvmKsZJqWEWRx1xFGJGukO934DfGM+
	KgjHWBe0ob8FpGyhO85L1fZ9xfExr1w==
X-Google-Smtp-Source: AGHT+IHV6PsO6y12ewZHr3MWVOJWidSpTpQlClrejx70mJWYDNFbEdEk1l+rCUbxECSlrgQR1s7NWGVtEF1StS9wJU8=
X-Received: by 2002:a05:6402:4311:b0:640:c454:e9 with SMTP id
 4fb4d7f45d1cf-64555b86b59mr33064672a12.4.1764594803734; Mon, 01 Dec 2025
 05:13:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129142042.344359-1-richard@nod.at> <20251129142042.344359-2-richard@nod.at>
In-Reply-To: <20251129142042.344359-2-richard@nod.at>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Dec 2025 07:13:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEwE+2LNh+tQhqxz=-k_BUmpTZzqKjTVOttMOQMiw3vw@mail.gmail.com>
X-Gm-Features: AWmQ_bk2pHDS-7D9zmjaB7BYnIR6PZ5J5FKq3pRqtdsUrUaQkVVuktxke-9JgLY
Message-ID: <CAL_JsqLEwE+2LNh+tQhqxz=-k_BUmpTZzqKjTVOttMOQMiw3vw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Document new common property: has-inaccessible-regs
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, arnd@arndb.de, lee@kernel.org, dakr@kernel.org, 
	rafael@kernel.org, gregkh@linuxfoundation.org, broonie@kernel.org, 
	tony@atomide.com, rogerq@kernel.org, khilman@baylibre.com, 
	andreas@kemnade.info, aaro.koskinen@iki.fi, conor+dt@kernel.org, 
	krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 8:22=E2=80=AFAM Richard Weinberger <richard@nod.at>=
 wrote:
>
> This property is used to denote that a certain register map contains
> registers that are inaccessible under conditions only a device driver
> can know.
> The purpose of this property is to disable register access through debug
> facilities outside of the device driver.
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  .../devicetree/bindings/common-properties.txt        | 12 ++++++++++++

This seems to be dead, but just so you are aware, new properties must
be in a schema. Something like this would probably go in dtschema, not
the kernel. (And this file needs to be removed)

Rob

