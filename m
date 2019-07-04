Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6493F5FC4D
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2019 19:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfGDROC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Jul 2019 13:14:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34558 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfGDROC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Jul 2019 13:14:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id b29so4705622lfq.1
        for <linux-omap@vger.kernel.org>; Thu, 04 Jul 2019 10:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YKH+xWe+BttcPVaCqsF3PWSJSZplaHazW9SoawD440k=;
        b=oXQmgmMhHOFILo1HhcSG9oUcSsxtTV9wX+f2MUP4P3lGnBaeIdnaV5iZ7dZR0yWvQ2
         tr6qSvbCLYZx0YhYs03zsmeg2mH0SaC5bWV15yGo65X0FIb6Sk2bhOTNRmVr8bS3nQ0e
         oMbpAOVVl1TdBDv32MI9jCott5Ag9gq8vB8UEL9VhpOqNWQOKxgTCEpExeTweqVaERI0
         zLvZHKuzxSSj4jTQNQhAlqZiGR7eGK9fU82I7KqUJk1j3ERRVsYTSo6tWMP1T6On9QtS
         wksGWpSXInwMhV6ozJWrYetyUAHCpnxbW4aCFoyFjbWn8KsVSamMGn74skByyfQc8u+Q
         VX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=YKH+xWe+BttcPVaCqsF3PWSJSZplaHazW9SoawD440k=;
        b=izMaZw1kZwYj2/QhgWnRCvm+Mho+xorddH1lo63Y6rHNC2jn6WtzcHsQLnrOXY+81Y
         yL6d0jUbYP1+7hMQaYaDYiOLTTJxjT6VqkX2L/zzjr1ewnJswzhkR3tOeO7VmGMUdNoK
         kDcKBmFhcfyA8fAiMC9DsXLNt/i6gctTMrFeO874jFXse/lVcv09ALrRPEKsssWpWbAF
         9fDpY3vAIc4S3MZ/NMVlHRbFGYAPGulvg36NX0bM/c+HizU8jcxWDJ+PmuzzSk2LHGpz
         VqLpg3On6HENyKbqvGqv2lfzbEmphT6CHgfmwKxLyCDFJxfOSSeXoubdud1brjDlp8eK
         rbDw==
X-Gm-Message-State: APjAAAWPmEi/LwV3A8TXMFK3hIpTDYjVkSoRKCLcQzqO1e0vF2UBZwVY
        lHxepU0Xw+npGc5aAyqRlWl5iw==
X-Google-Smtp-Source: APXvYqznvhJ+B6D0vbPhVtkczPtzu2YSf1ZgOJZB4pG+31ZlBB8MBurdpFHTZBM2/+e4mJi7N60IJQ==
X-Received: by 2002:ac2:5dc8:: with SMTP id x8mr20664658lfq.94.1562260440563;
        Thu, 04 Jul 2019 10:14:00 -0700 (PDT)
Received: from khorivan ([46.211.38.218])
        by smtp.gmail.com with ESMTPSA id 126sm893452lfm.44.2019.07.04.10.13.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 10:14:00 -0700 (PDT)
Date:   Thu, 4 Jul 2019 20:13:55 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     netdev@vger.kernel.org,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        grygorii.strashko@ti.com, jakub.kicinski@netronome.com,
        daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next V2] net: core: page_pool: add user refcnt and
 reintroduce page_pool_destroy
Message-ID: <20190704171354.GC2923@khorivan>
Mail-Followup-To: Jesper Dangaard Brouer <brouer@redhat.com>,
        netdev@vger.kernel.org,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        grygorii.strashko@ti.com, jakub.kicinski@netronome.com,
        daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <156225871578.1603.6630229522953924907.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <156225871578.1603.6630229522953924907.stgit@firesoul>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 04, 2019 at 06:47:07PM +0200, Jesper Dangaard Brouer wrote:

Have trouble with inet today...I will pick up it as my changes depend on it.
And send probably in couple hours after verification.

-- 
Regards,
Ivan Khoronzhuk
