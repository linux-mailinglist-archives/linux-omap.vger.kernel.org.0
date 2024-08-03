Return-Path: <linux-omap+bounces-1831-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA4946A27
	for <lists+linux-omap@lfdr.de>; Sat,  3 Aug 2024 16:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E56F1C20B4C
	for <lists+linux-omap@lfdr.de>; Sat,  3 Aug 2024 14:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142AD15350F;
	Sat,  3 Aug 2024 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hk3jmaKh"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3EE1534FC;
	Sat,  3 Aug 2024 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722696993; cv=none; b=M7YxQtsVI8pXARYmHh2S/KpultGxjRdIVHwdZYgKhSlVv9R1KgFfjPwI7/UCYpG366eRT00J+R9bATFNdEFTjDd0XarVey4yUEJ6icsW8LrGKOsZORrsXTBSFFIKFHryXko4MV1+eVqh2ngGB0jm4AzQ3fC7apseaKgVG+UHSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722696993; c=relaxed/simple;
	bh=PN539kz7fZflWgu1XQ02j8F7hL03JEDKTzVBm+Rd2y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alANKjnJtp5fjRVaCo0X2oW/yLzZcSq6pPvRKhKgJukxT8IchQFdHceRk0mVxf//AdTNmw3q1nbYrOqbW+anFLewkgsHhbQkdKi9LiwC4g6m4S6vb92DCA9/g0Zkrc6m/e0wvF+3/3IxF0wVG+PVeCqjnwa9McI6hg+YTbQIsiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hk3jmaKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33FCC4AF0D;
	Sat,  3 Aug 2024 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722696993;
	bh=PN539kz7fZflWgu1XQ02j8F7hL03JEDKTzVBm+Rd2y0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hk3jmaKhpGXUU6KJbiRZ/Fo85HG3cA9oUU1TAG5KrSzutEYcRFY2wtjAk5G/xBcpc
	 U/G4h0vHlxY0yTL2CcQwDNpNO0AqmoNXRe548dfKjh3AbdbsGRwC0ADQzobSkYUSEc
	 sgMCvRglpW4uLtshtuXJfyiYvSwoRPKaFtP0Nt9x+/E2pbaaXbEPEtdHF9e+nKKxTj
	 JvwTr1E7WI7MozRkfXMMz6kYDtf6Gvt3GbGSbz5O+7dSFIFQ7L5oePmSSb0sVRZcF6
	 fw4Qj8XvM0eTABurZ6Zl2OSBuQVMhtHpb1z7Fs7IkuKDKtaGwqqG3t2llybLsT3NrG
	 v4xIinU8SjPgA==
Message-ID: <2ff177ed-a5e8-46ad-9902-14f377033da2@kernel.org>
Date: Sat, 3 Aug 2024 17:56:28 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: ti-sysc: Use of_property_present()
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240731191312.1710417-1-robh@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240731191312.1710417-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 31/07/2024 22:12, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_get_property(). This is part of a larger effort to remove callers
> of of_get_property() and similar functions. of_get_property() leaks
> the DT property data pointer which is a problem for dynamically
> allocated nodes which may be freed.
> 
> The code was also incorrectly assigning the return value to a 'struct
> property' pointer. It didn't matter as "prop" was never dereferenced.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed by: Roger Quadros <rogerq@kernel.org>

