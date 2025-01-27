Return-Path: <linux-omap+bounces-3231-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A66A1D6B7
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 14:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5729C1886A8C
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 13:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C121FF7C9;
	Mon, 27 Jan 2025 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcUQFfnL"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D961FDE28;
	Mon, 27 Jan 2025 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984451; cv=none; b=eCPUYmWskBwYGyXzczeBdd4vZW+AV6vrF5zUI5e9UIsnCPCBUAYpdzShF4c7Y7QlQqJ/Xk1lHRzRcVM7jLqWK5bsg4EnyB80U+OmOBPPysJLicO2gpXdH4olRTPlXd805BOGf8nRVRyDxCsN5xg21nClsQ5hkaaOUm4wEJloeac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984451; c=relaxed/simple;
	bh=bAny3yr2fy5nuI5kPcM4sqyE29xzBeO3x2QufdCZ1k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1DNtwLztQ4njIp5VjED4VxhKSEd9/hUOhE6McyUWIn2T7Hkx9WdDEnehRpQ2MCLwki5hUjwU++L8j+oT4yKdM1nMk3EB4PFW195i3UBGYlgkTnapoRtNKJeKKF65E9+WgNj+L5NeJjerIofLK0A5l66q4CX9R3sjmjDVtJ8JWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcUQFfnL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B23C4CED2;
	Mon, 27 Jan 2025 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737984450;
	bh=bAny3yr2fy5nuI5kPcM4sqyE29xzBeO3x2QufdCZ1k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcUQFfnL+wFRIPD0CZhRiIKvtJEuVy/NivGhf//IOaZ9k3gZSqO/STW7G2e9TOmf+
	 cD9AL5ualOkYjMegD0T9ec9VZAxFR63/e1xtVAQAWTo0EQGSSSVVTSKJHVwtnPwt6a
	 Bx3bX7FrjBkN5uCmAFtP9jeus3NiyMu6qH1HaEUwGA+cjKPTeCLkpLBQRu6433FQ8S
	 OVqgXS9nmOyh5dftgcOvqNJVMhk9Efr6R3Sr4FQ9zGcd9Nqi1bekqRq5lN4pKW7yu2
	 BVkkskd1xkCkOukSSAO9KzJrdvnETCo2uIMeizCKdaPJCQtKGbV2oyHK4pwkMbHcYh
	 IhxDqv3SWxXtQ==
Date: Mon, 27 Jan 2025 13:27:25 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: mfd: motorola-cpcap: Document
 audio-codec interrupts
Message-ID: <20250127132725.GC1440743@google.com>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
 <20250122164129.807247-4-ivo.g.dimitrov.75@gmail.com>
 <a60f468e-857a-4f4c-b3d9-3ee8faf6602a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a60f468e-857a-4f4c-b3d9-3ee8faf6602a@sirena.org.uk>

On Thu, 23 Jan 2025, Mark Brown wrote:

> On Wed, Jan 22, 2025 at 06:41:27PM +0200, Ivaylo Dimitrov wrote:
> > Add DT binding for the audio-codec headset detection interrupts.
> 
> Lee, would it be OK to merge this via ASoC?

I'm not sure why you would want to and it may make subsequent changes
more challenging to merge, but if you really want to ...

-- 
Lee Jones [李琼斯]

