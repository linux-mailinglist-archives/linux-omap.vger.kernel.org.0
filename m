Return-Path: <linux-omap+bounces-762-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB186C2A3
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 08:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6723A1F22DEE
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 07:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0BF47F53;
	Thu, 29 Feb 2024 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="x9cFIalg"
X-Original-To: linux-omap@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3147F42;
	Thu, 29 Feb 2024 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709192046; cv=none; b=ZmToVk+AuR0Ior9iQsuL/TsrqOk53jkn4cZhq5Udj/izftadq/0MU6O9TXd/QY3ISVw5btB6SgetzEcFPYiGBNB0K372OKt7F48lx+R9VRKHXarhsFGiV+doEs/vQq3ZbQwFgL70CVHaYnN5irJ1/yTi8YyTkLBe+Ls8uL9V7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709192046; c=relaxed/simple;
	bh=upVVE5UZbd+pNFh7XTDBAnXaQKzlOnrLOZYiup6SgMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnHBViXYI9DQlL/T1zwqVwS/Npm0LNNtLPOenSKiaxJtm3I0/ogWfIO2yhfwDaX+9xnOjiAR5rFPRFKqHup4jxeil2O9eIX8eLE5mBP5NJ6x2r7jkhH9I2d9DE1Hua21+uudGysuLNIfjd1gtDpXtS3Is63YZigpO9wYtKCMZ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=x9cFIalg; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=JWP7vIFZ5FuFgqo/8c4mSpijFYJIYzeqkTzRqdlTjAA=;
	t=1709192043; x=1709624043; b=x9cFIalgwTHEEJ2FkFv7AmxFqx+qkWlzRWRtQWXTd9nU9LN
	Lq7223drK7s+6CgLijmMaDn20rxQLv61zF2Ic/HuAFVJKxveIM4L/96Q/eAdHg6ZFALAQQ1fgq/BV
	JagsgnljaEK/b+ZxqADc6lZvH3zwu/gDVBgjBlKlb1SvhNfeRop35yVg9iRfEOvu8KYRHZ7j2mURR
	j0hCNh3jKuaNIwPxKgvE/cotPf6cOds06L0ThXIh5G6IE1QseqVunwJCdERh/kI3TURqS4fkoUE52
	NlsEGJXYLrcPOUhuMwzuRVD9NIJXXQnY99MUDCVKKR/W2u3E2rDb4E2b44QqzEMA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rfavT-0007TL-7L; Thu, 29 Feb 2024 08:33:55 +0100
Message-ID: <d3e2c122-da90-4c72-8db4-e69a243a4b74@leemhuis.info>
Date: Thu, 29 Feb 2024 08:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
Content-Language: en-US, de-DE
To: Andreas Schwab <schwab@suse.de>
Cc: Tony Lindgren <tony@atomide.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <mvmcyt13idm.fsf@suse.de>
 <c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>
 <20240215094640.GS52537@atomide.com> <mvmeddeyqb8.fsf@suse.de>
 <2024021516-stricken-bubble-bf8d@gregkh>
 <2024022022-happiest-affirm-60cf@gregkh>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <2024022022-happiest-affirm-60cf@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709192043;7bc27738;
X-HE-SMSGID: 1rfavT-0007TL-7L

On 20.02.24 15:35, Greg KH wrote:
> On Thu, Feb 15, 2024 at 12:16:34PM +0100, Greg KH wrote:
>> On Thu, Feb 15, 2024 at 11:28:27AM +0100, Andreas Schwab wrote:
>>> On Feb 15 2024, Tony Lindgren wrote:
>>>
>>>> There was a regression recently with the PMIC which would cause NFSroot
>>>> on devices to keep working but may have affected MMC. Please check that
>>>> commit 7a29fa05aeca ("mfd: twl6030-irq: Revert to use of_match_device()")
>>>> is applied.
>>>
>>> That commit hasn't hit stable yet.  Maybe it's because it references a
>>> non-existant commit id (1e0c866887f4 instead of 830fafce06e6).
>>
>> Yeah, our tools can't do about a commit that does not have a cc: stable@
>> tag in it AND the only commit it does reference is not one actually in
>> the tree at all.
>>
>> An impossible task for us here, please ask stable@vger.kernel.org to
>> take the commit if this is needed, and let us know how far back it
>> should go.
> 
> To be explicit, does this need to be applied to the stable tree(s)?  If
> so, please email stable@vger.kernel.org with the git id to do so.

Andreas, Tony afaics asked you to do that here:
https://lore.kernel.org/all/20240226113635.GX52537@atomide.com/

But unless I missed something nothing happened since then. Did it fall
through the cracks? Reminder, if that patch clearly applied to 6.7.y
then all that's afaics needed is a mail with a simple text along the
lines of "Greg, please pick up 7a29fa05aeca2c ("mfd: twl6030-irq: Revert
to use of_match_device()") for linux-6.7.y, it fixes a bug I ran into
and Tony is fine with it."

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

