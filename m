Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43DE2038E1
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jun 2020 16:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgFVOOx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jun 2020 10:14:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51205 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728954AbgFVOOx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jun 2020 10:14:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592835292; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=F9ZYPJqnwR7qLas1OFPPs1HFrhNZLi85hn9x30GxDr4=; b=R4tiX/qlVxmDcS7TuqvTX04F3yb2nJDrxV5WBLbu99GZlPXOuL1TaSt2cVKUJ+4tXKO3Fy5q
 314X12mijrvSFM0WnqvECyWMtNQk7Is6de7BUi2NceyAv/0CpOukRJvYqmreJo2/jVFS9gsr
 Y286bOhocCSqSkGlMmK5mdOHhGM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIwZGJlNiIsICJsaW51eC1vbWFwQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5ef0bcd4117610c7ff28d250 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 14:14:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 42D91C433CB; Mon, 22 Jun 2020 14:14:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F49FC433C6;
        Mon, 22 Jun 2020 14:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F49FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Eyal Reizer <eyalr@ti.com>, Guy Mishol <guym@ti.com>,
        linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/4] wlcore: Use spin_trylock in wlcore_irq_locked() for running the queue
References: <20200617212505.62519-1-tony@atomide.com>
        <20200617212505.62519-2-tony@atomide.com>
Date:   Mon, 22 Jun 2020 17:14:40 +0300
In-Reply-To: <20200617212505.62519-2-tony@atomide.com> (Tony Lindgren's
        message of "Wed, 17 Jun 2020 14:25:02 -0700")
Message-ID: <875zbjgpbj.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> writes:

> We need the spinlock to check if we need to run the queue. Let's use
> spin_trylock instead and always run the queue unless we know there's
> nothing to do.

Why? What's the problem you are solving here?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
