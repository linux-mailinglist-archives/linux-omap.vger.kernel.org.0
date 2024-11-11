Return-Path: <linux-omap+bounces-2658-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F619C45CE
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 20:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5D0B1F22112
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 19:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E1E1ABEB4;
	Mon, 11 Nov 2024 19:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8GHVwE+i"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F719C569;
	Mon, 11 Nov 2024 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731353150; cv=none; b=At455HtQVY7OaO0uNhLKJ1p86TEWYVkNctm+Hj1ptK5P7HY2chFehmbIvPLr6Pd3mgwsnzb6ZkKHMb8Tz65esFxd4i/3JGe6miNgYfKloYqLQYV98iVETLQdl0L0fyBvUgE+6PtQW3XGswVvb4zHuNF5hfR2tsZJjSpNSQYCdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731353150; c=relaxed/simple;
	bh=4hfTcRkqjzCXY7GfYn9nK1+XoaX74nucfiPy5eaXx0k=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q2yk0lyIQoyRcUto5xLEmmuasoWNDcSLefzJvJq4XinhbGudbJw3ob7ttxoV6KIvgLXgzjkYh4zzfC4aItEzRnxVbauG2SFZPNcOrO+nnWZg4m8bqdY/GkxrxehLSRtzlXXQhqKXU8MZYsGDFi3QOyYV+pt2oENECZ0DYG6GHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8GHVwE+i; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DX6jH85JLHIjpQyLSljEPQCb5trtk1s72Pw9EqiaxN0=; b=8GHVwE+iNuM2UWavlGDqB3pSmQ
	Bp0Z2mjhbKk7vzx4FrTr0NKupvseqc1HA4tZ5NL1havfVdyLTVcDTzVZscHjcgFFSVCZDglrztpzy
	7ABu2c4Vqm7DZrnWotzp69foPU/Pwt0+jsLQ2w55nGvthnJT0wNenR20yksdKW605PyKPLBBfxQ5G
	V+Wgwt+KBV6rzmlMkyydRtjbqu4jApzU9tKi7wPyTLJz0zqeYJVNWUUK06QjYeCdQWdxOQ4/gvE6z
	coFxOGP9UBMxWekYcqDTLAmAdYmraunigdNLbdyjiz7upmZHKPgq5XKqIDIJny0Exo4wr+PpiOxwl
	MahdF6Fg==;
Date: Mon, 11 Nov 2024 20:25:43 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: khilman@baylibre.com, devicetree@vger.kernel.org, Tony Lindgren
 <tony@atomide.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Andreas Kemnade
 <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: tsc2007 - accept standard properties
Message-ID: <20241111202543.582e6a3a@akair>
In-Reply-To: <20241014141240.92072-2-andreas@kemnade.info>
References: <20241014141240.92072-1-andreas@kemnade.info>
	<20241014141240.92072-2-andreas@kemnade.info>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 14 Oct 2024 16:12:39 +0200
schrieb Andreas Kemnade <andreas@kemnade.info>:

> Only some driver-specific properties were accepted, change it
> to use the now-available standard properties which are
> found in devicetrees containing this chip.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

ping

