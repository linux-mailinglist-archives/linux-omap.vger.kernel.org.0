Return-Path: <linux-omap+bounces-4610-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5BB4968B
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 19:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D093AFE3D
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 17:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9E4311979;
	Mon,  8 Sep 2025 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ey/+SqxR"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C842331064E
	for <linux-omap@vger.kernel.org>; Mon,  8 Sep 2025 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351368; cv=none; b=lH4HoCFc0VNCOYn19Pj4hu7Aqsu3RtH03MNkIYyq0CcYdDXweIZhCDNCMUPi2UOqE97Zu7erqE1d5OHRYG3jaJgooZcwVltTUmSZHoqdLvKPAdce00MyY2vzWffmIlGYWqUZmCcoLdIOILkjxczpENXNqAQFS+Ao2VYqK84m+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351368; c=relaxed/simple;
	bh=nEnJefsPnqX5TFlOhSjy/aCZuFSg/cMMij5f+DaISJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM0BdERiPfDbkRO7nzkZc9fK06piRXHRy1sEz62AOL+tOhWwTsQvh5+Ab9iXnSK2bAieh20J9TMOVaLpr3qEX4Ojx1nZuNihog3v5Bmrie18t4Y0Uk8MnH/rQwujTIMOO6eGACjnV1XTid7JbK8KibxSJpOHnxcoBliYlBP0GBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ey/+SqxR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BjGSfoNLufNCcnOWJhIHlOPvlvWzDfGM2mQB9ETv4Jw=;
	b=ey/+SqxRypwhpYI/XhRuGq0Rb1fH9RwX+ii0Q7d5I0llRA2q0lFq3Y+SlC+nNnrLJtTp2v
	6c6CXJZguFc7xLSxRlIzsRjQJCroQTqWEVwErW1AM4mR8mE1cxaAJW38TkN9zOkXKNZbCE
	+urWsWQ5kLhjwlFJ+9vorxH27LEpbMU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-Gh8_UqceOuqaw3XMBh3ZHQ-1; Mon, 08 Sep 2025 13:09:24 -0400
X-MC-Unique: Gh8_UqceOuqaw3XMBh3ZHQ-1
X-Mimecast-MFC-AGG-ID: Gh8_UqceOuqaw3XMBh3ZHQ_1757351364
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-728f554de59so137490326d6.0
        for <linux-omap@vger.kernel.org>; Mon, 08 Sep 2025 10:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351364; x=1757956164;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjGSfoNLufNCcnOWJhIHlOPvlvWzDfGM2mQB9ETv4Jw=;
        b=JGiKqLjOBqapUqiZMXHMbT/TqzixwSgvZHeBfF+OlE9xkrVbFhAEA35ILuyg8UYgQV
         L7lszZpgafN29pD7i4/jyM+tMZWI8xDShqd8YF/Rao0SPcBh45sQUSXsBxyM2kGZOCJD
         DNV8R+upMGlOcdph5frQSAm95GFvAdKh/TzjxG9kOX4c+bv3dep8qT7nN61oBH2jAS9C
         3vTPqRby5me08gXcv/OFCZ2LXWVOPNSIauWndL8/ozRcgaW8bfNCh0JjymmVfxySWQUU
         pSrBhc36nGvum4bT7VOVUST9kjm1zaNozfs9EBkFpYgFZn1ySyajgRYFbWRlSiQO/RGF
         Bm/g==
X-Gm-Message-State: AOJu0YzTQcTnZjQgE5sQf3zvHZT5+Qh7R2hH7mgQSvNlm4axvzbUkhwg
	IbyjZLy7WhGCxLZlEpFOQJhzUlS9D0/yzaVoapVB+CYxN3DjbzdA/jLA2kqbLEIyTxvjhY8Yos4
	1Lhk5TC1in0LIh8a80ZjQKKjpARy0nlUXdPuXV2zuSRJUGxq3VDClg9bh3scmtY0=
X-Gm-Gg: ASbGncvtamt8E0t74xMlo+u4bO+D2Hz/daDCmx0rxu6W3vNZrY47QiLTOqmy2BVNtRy
	n6RhABencglsMu4emLxdHspGDJopvipu8tSBxnArgP8gvJNb/cbQbGkWKtxHwKhlsCWJfm8+mez
	Q+I0P8xV1mtVOAEgksHOQ9uYIRGT6w6B+0OwVOTMsjXdFox3Q9jDtk8RdhE5pLhg2DJMGhBKzoI
	mPY3W24dRFP2pdRlDzbntGshFYWbkpnHEoZvnO7VeqS9Y9UApOsagoyYaudIxkdPONanqlF9QsW
	hj6Ca155p3zBBa7unZkkJ6IP01QePdT+ClqDGXSd8W0xsuQVZ+EizDTQV5E=
X-Received: by 2002:a05:6214:460b:b0:742:1ea2:b5fa with SMTP id 6a1803df08f44-7421ea2bfc1mr87069476d6.27.1757351363904;
        Mon, 08 Sep 2025 10:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED5LQ1C1kD2cQaTdi6CchCpZ13f6Gj4BgYLX1Z0AMPVgl9HbDNtaLifWHhEKfT7Yq0Zl0NpQ==
X-Received: by 2002:a05:6214:460b:b0:742:1ea2:b5fa with SMTP id 6a1803df08f44-7421ea2bfc1mr87069046d6.27.1757351363366;
        Mon, 08 Sep 2025 10:09:23 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-721cf6d6cffsm119097426d6.54.2025.09.08.10.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:09:22 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:09:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: ti: convert from clk round_rate() to
 determine_rate()
Message-ID: <aL8NwHe00OeVuAuW@x1>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Aug 11, 2025 at 08:48:05AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops. The first two patches in this series
> drops the round_rate() function since a determine_rate() function is
> already implemented. The remaining patches convert the drivers using
> the Coccinelle semantic patch posted below. I did a few minor cosmetic
> cleanups of the code in a few cases.
> 
> I want to call out the changes to the dpll driver since a fair number
> of changes had to be done outside of Coccinelle. I unfortunately don't
> have this particular hardware on hand, so I was not able to test it.
> I broke the changes to this driver up into smaller chunks to make it
> easier to review.

I included this patch series in this PULL request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian


