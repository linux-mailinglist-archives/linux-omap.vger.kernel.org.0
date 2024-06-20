Return-Path: <linux-omap+bounces-1568-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DB91090E
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 16:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E9E1F240F6
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 14:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD691AED25;
	Thu, 20 Jun 2024 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="E3ggvSCR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2774D1AE096;
	Thu, 20 Jun 2024 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895258; cv=none; b=TcLSUEy7KcgtxNINcPqYoahF9eizDvMU0iKrjrubRJ2jHyhGKhr6kLRHnlDhQu1nGEkuXMIj/Yb1J3GkEWjJk2V6as0H8S9K3q8VJBrUwWBoXgp2h5FDgZKhdgEVN1q+60V2u7AQnG60E6/zB+J3gmdTyv3VvXtIF68qryi5+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895258; c=relaxed/simple;
	bh=rqz7mptSZXadmEmaYlv2lustuXRLeUAJmakIx5iONiA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBUq3mOJXeJNKwX767y9j/aAHp5TohyDY44rw7vKta2tK+CcB0DsQWXlOnmeP9vcWBrOtnnZbIkP20UcIajXl91XDXKiLKZQDnOjNwWHQPU6oSuzSR6NFEMBTvYgXISp7IA4BjKUDT7u5xozYqHtuwzE76h7fsv5+cme9pyRsGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=E3ggvSCR; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKIcd-000PnA-24;
	Thu, 20 Jun 2024 16:18:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rqz7mptSZXadmEmaYlv2lustuXRLeUAJmakIx5iONiA=; b=E3ggvSCRUiI5paGf9pWHQzxYiM
	fJJOmDPx+9i9GxFK1mhegpwerQoVzuoC6BTsI/xsf5oQgnIP0d7ziy2EjF8TgEWlFrXkcpWkSlvdb
	VAjdce6oPRnUbwF06ZLiB74N+f4QLBgr3oDzYkJCbK4/okZRIUwQFXtWc5byLLjs+15YgeA9TGyjF
	4/M5IiipVBy7aS06D/JebOIffz+ugqmF8Ec2RQOrCwI5l02EQWskfDtNjszxf1aSgs53G/9s32VHc
	zBk4BoyZhzzIUge91RtlB2Z8WgPuUum03UHKIR9Q8r8MsB3CdNM7u8ZWLe1rtBUA4eflFwTdwKRFv
	NzJRWqZA==;
Received: from p200300c20737c200b1839a3e94ddce00.dip0.t-ipconnect.de ([2003:c2:737:c200:b183:9a3e:94dd:ce00] helo=akair)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKIcb-003MgG-1O;
	Thu, 20 Jun 2024 16:18:42 +0200
Date: Thu, 20 Jun 2024 16:18:28 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil <bavishimithil@gmail.com>
Cc: =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Message-ID: <20240620161828.68e1975b@akair>
In-Reply-To: <CAGzNGRnnZWJP6CF1X6SXus2QCwUA763=qHUAy6c6Ny6_FFd7GQ@mail.gmail.com>
References: <20240611132134.31269-1-bavishimithil@gmail.com>
	<20240611164951.51754ffc@aktux>
	<CAGzNGRmoSawz7yHGzHS8PeQwRAsnnORLMPrrNBLupNdaOkUeHw@mail.gmail.com>
	<CAGzNGRnnZWJP6CF1X6SXus2QCwUA763=qHUAy6c6Ny6_FFd7GQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mithil,

Am Thu, 13 Jun 2024 14:15:19 +0530
schrieb Mithil <bavishimithil@gmail.com>:

> On Tue, Jun 11, 2024 at 8:19=E2=80=AFPM Andreas Kemnade
> <andreas@kemnade.info> wrote:
> > I think the twl6030.dtsi and twl6032.dtsi should be as similar as
> > possible. =20
>=20
> Hey the values seem to be different for twl6030.dtsi,
> omap4-epson-embt2ws.dts, and omap4-samsung-espresso-common.dtsi.
> Should we just define the nodes in twl6032.dtsi and let them put
> min/max volts and other properties in the board files?
>=20
IMHO either the full range there and override board specific stuff in
the *.dts files or no voltages.

Regards,
Andreas

