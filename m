Return-Path: <linux-omap+bounces-2451-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D839A2D3A
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 21:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDAFAB25307
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 19:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419E221C17C;
	Thu, 17 Oct 2024 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bO0sfrEl"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CDD1E0DC3;
	Thu, 17 Oct 2024 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729191947; cv=none; b=ZO4IWrI/TM7bqxcISTC4NCe5Dsc8MDRmKy/x55zm8otOgFpMiuzcwZdH3gfS0oimEVfSOv3szNYL2jBl7aZK0BqNYxI4twGk3spE95JJVc6a2+vRscGwy9wJlfBprXORQVTgoUGDcan5kfHECdlDLJq7ePb1L5ak/S7lAevzIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729191947; c=relaxed/simple;
	bh=VQaBVm9CjXK0nklcOUYIdZpmxP4P6wdk49V4w1nZPZ0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ePern+iwsGMPz4SPssfo/qGHhPUK1vlf7E+YEtX+58cgK2sMEq9iPQVIjuo5xsYrax/eBzAE61inqVguPi6fWfHRrWHRCEMi2vA5AUTfOjMbX9ALCTDFeMRs1t0sdIGeQxMz+QFg9WORMUS9VbH1I7srGxQh75WZ2uuplyNAHAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bO0sfrEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0618C4CECE;
	Thu, 17 Oct 2024 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729191947;
	bh=VQaBVm9CjXK0nklcOUYIdZpmxP4P6wdk49V4w1nZPZ0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bO0sfrEl1cB8MBNxrCsRRmzTLSLp8SsBhPWN0X94jAGbYEAm43j/Xli5RhxoozpQR
	 k2anvNMPRnmaGV5v2sWGf0eSscXB1faR/IxjWqgt2jI7duaP0MdogLjOxE8P9lkE27
	 p2ZtMe9bSTc93VJc5s99tIJsE+t7jlSvmvO76I8x/RscqeDcsCqJ/B+RySu5iRKAFu
	 NY+3HY/mhtPCDpdaZWLV/pN2z61TAaE/ZmKIPrGlw5i2LQ3nhQi+sMjraoixf8oX7j
	 N37or/8tZXQ1/ogSMJy0L1Y2deD0T6nZGyHjTHe2z/O76K5qfU+qgN+T1uo5F7IqtT
	 aFF1bTHAvgqYg==
Message-ID: <fdc177319e03cd0f8deddeb2146eca55.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241014161109.2222-3-andreas@kemnade.info>
References: <20241014161109.2222-1-andreas@kemnade.info> <20241014161109.2222-3-andreas@kemnade.info>
Subject: Re: [PATCH v5 2/3] clk: twl: remove is_prepared
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Thu, 17 Oct 2024 12:05:45 -0700
User-Agent: alot/0.10

Quoting Andreas Kemnade (2024-10-14 09:11:08)
> Remove is_prepared to simplify adding of TWL6030 support.
> The default implementation should be enough.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> ---

Applied to clk-next

