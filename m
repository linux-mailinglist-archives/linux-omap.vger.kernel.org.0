Return-Path: <linux-omap+bounces-4213-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A6B24C6A
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 16:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D3F1189C6D9
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 14:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAAB2ECD32;
	Wed, 13 Aug 2025 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJ+5earH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6971D54D8;
	Wed, 13 Aug 2025 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096484; cv=none; b=PhcV7mqAVWQwREjC+uWU3YlzVfDhxEjNZ1BpwFC+0Lz1jmAqn7mfuGFe1puDlsdtN4Vv7h17wQxxUlzbA+1DYMi8ROAPbYHn0e5U44y5boxxRmJE9t2qJHYgLYeormAZ3/9kHaaaSV44PuwdZB38By3qoQGa/pV/7zzmbOisgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096484; c=relaxed/simple;
	bh=Qn8agVW9Vlcdpw9sdzCP4IVz3IhuXOJzbYXLkGDbi9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKZd+mxVh0Bv+zeRf5KVEU2QoySCmKEm65D+wM8ixagOkTbQMTuHDBrvFqniwEOSKuWoF2HzbEBKGGidjG6bjYi9vHdlx5MtWCC0JUegCPH9l6XZ04vDalDTcxzuR1BSyOWLv/VtyeY/EUXeLpvKFJMfUuCcpFJ2drfLOFLOwXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJ+5earH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0743DC4CEF6;
	Wed, 13 Aug 2025 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096484;
	bh=Qn8agVW9Vlcdpw9sdzCP4IVz3IhuXOJzbYXLkGDbi9c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WJ+5earHOqQatrSxfBJByiizZL9FAcLc+WKCq9ogrON7Wvj8KX2WLcohGJCWZa83g
	 d15jRGcqsMGmyxjVgqkDCTM7Kjryz4pf4+qDB4qVOfjesSXDXheeZSHvl38VgKntSs
	 0HRj0k6gbXf+CiHVL6P1+vN267NnSR2ovXNyS8A2hiz4t9UAN3p/maZJ/Lbnr1wHt9
	 qRzvGSTsBs0VuXl6x3J5EDjZtkGyraW3dJOmBIOT8YwgyZmuIYyWeWfGF9IlS8Gjmn
	 SblkTEKOfpRW0wgUdUH484VEiWKE8GoS7ox3HUYQxHFaNgwEN8gwYvofYsQprDCaw2
	 M3zVOtUlw4E+w==
Date: Wed, 13 Aug 2025 07:48:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 8/9] net: ethernet: ti: am65-cpsw: add
 network flow classification support
Message-ID: <20250813074803.06db304a@kernel.org>
In-Reply-To: <d787ca03-a54e-46ae-828b-68fbd7b0b3a8@kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
	<20250514-am65-cpsw-rx-class-v4-8-5202d8119241@kernel.org>
	<20250516182902.5a5bfd98@kernel.org>
	<d787ca03-a54e-46ae-828b-68fbd7b0b3a8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Aug 2025 16:49:27 +0300 Roger Quadros wrote:
> On 17/05/2025 04:29, Jakub Kicinski wrote:
> > On Wed, 14 May 2025 15:04:28 +0300 Roger Quadros wrote:  
> >> The TRM doesn't mention anything about order of evaluation of the
> >> classifier rules however it does mention in [1]
> >> "if multiple classifier matches occur, the highest match
> >> with thread enable bit set will be used."  
> > 
> > So we're not sure how to maintain the user requested ordering?  
> 
> Currently we are using the user/ethtool provided location as is.
> 
> > Am I reading this correctly? If so then ..
> >   
> >> +	if (fs->location == RX_CLS_LOC_ANY ||  
> > 
> > .. why are we rejecting LOC_ANY?   
> 
> Because driver doesn't have logic to decide the location and relies on ethtool to
> decide it if user doesn't supply it.

The location supplied by the user may have semantic significance.
IOW locations may be interpreted as priorities.
It's better to support LOC_ANY and add the 10 lines of code to
allocate the id in the driver..

