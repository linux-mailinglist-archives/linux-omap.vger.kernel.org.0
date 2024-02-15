Return-Path: <linux-omap+bounces-607-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 465188561B3
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 12:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A74C1B26E8F
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 11:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B143129A91;
	Thu, 15 Feb 2024 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aeF8PZrM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF924B26;
	Thu, 15 Feb 2024 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707995798; cv=none; b=GwEcI/1OWCXUjIL1MAlgp1khVVMtUiQahAezN1dN0zXMP+302lyVi1/msez7KahqGVP91STwA+FvcIX1jGEcpfAos4l1U9PhGJlrA7vtNhu4vh7mVj3IOPqfkGDfY1v23OFNFtnwqmRCpWF89JiDlW+tEf6+T3MJmG7HsK+9MJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707995798; c=relaxed/simple;
	bh=6xdyrChR0wvTNah2WnJ9/7BbmJe93P+B2CIToWbynNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqdnEhsE1Ub2Vbbb7bGk2AHEiBKq5XV7N6t8ah/HZ3fBffiTYJ6zjC/i0PqaUSDMBnuBIIeJFEqz4eBCTBkCRZV2dh9BI/ChFSZntjdbuy6F4vTMZ767pkTZ5MeNhGOQBYBGxUx9yFWUWyb5HRknqmlbWjoyAfPYgw3c8QRTlpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aeF8PZrM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D95C433F1;
	Thu, 15 Feb 2024 11:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707995797;
	bh=6xdyrChR0wvTNah2WnJ9/7BbmJe93P+B2CIToWbynNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeF8PZrMQyFAWqhbg1iGM/zPzrFBl63CLpv55n58dO5t3cpc4TxW9Rtij0pqzTWel
	 wVBZ/XfBOiAqzww4BAk/svd1VNMUfmYKS9kV+Z50+qruA0IzcwpPzvhesoVfqKD8SX
	 OdR6dtHm/lO82swjiP4Lla3x5iYJmDuxru4tEuwI=
Date: Thu, 15 Feb 2024 12:16:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Tony Lindgren <tony@atomide.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
Message-ID: <2024021516-stricken-bubble-bf8d@gregkh>
References: <mvmcyt13idm.fsf@suse.de>
 <c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>
 <20240215094640.GS52537@atomide.com>
 <mvmeddeyqb8.fsf@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mvmeddeyqb8.fsf@suse.de>

On Thu, Feb 15, 2024 at 11:28:27AM +0100, Andreas Schwab wrote:
> On Feb 15 2024, Tony Lindgren wrote:
> 
> > There was a regression recently with the PMIC which would cause NFSroot
> > on devices to keep working but may have affected MMC. Please check that
> > commit 7a29fa05aeca ("mfd: twl6030-irq: Revert to use of_match_device()")
> > is applied.
> 
> That commit hasn't hit stable yet.  Maybe it's because it references a
> non-existant commit id (1e0c866887f4 instead of 830fafce06e6).

Yeah, our tools can't do about a commit that does not have a cc: stable@
tag in it AND the only commit it does reference is not one actually in
the tree at all.

An impossible task for us here, please ask stable@vger.kernel.org to
take the commit if this is needed, and let us know how far back it
should go.

thanks,

greg k-h

