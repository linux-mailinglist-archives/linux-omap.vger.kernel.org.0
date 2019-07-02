Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38475D1F7
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jul 2019 16:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfGBOoe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jul 2019 10:44:34 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36150 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfGBOoc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Jul 2019 10:44:32 -0400
Received: by mail-lf1-f68.google.com with SMTP id q26so11604668lfc.3
        for <linux-omap@vger.kernel.org>; Tue, 02 Jul 2019 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WjQyJp2iY5fGQc+V5V9CzoNmpSilM+nwtjmuAYauCEg=;
        b=NiF3piWStntZFsAy372v0MM1GMImhKld5gDip0Lu1PLdyy6+Ltl6+a2jJU5tTmYId9
         8jZ85ljZHm/Bpx3imlNI+faosGx7aI2iRRrJiM5V+sj0CV6CX1wIYNmXGiEY981UNrxO
         hf8yWMUWJOFuRXFWZ+dmcoS5Gk704pP5LQwI3JsKuHQrZ7x3sfjvw597qSs8xEaES7oM
         hpqzKPmzVUxa0Z7jiwBzpTrtulmisvOdcmKjTaOkdj0lrwULUL/oMw4WWU5HNrxnq/O8
         QVwG8w9rbhVvPmzIPIiOmh5pw20NMIIUgjXgIlRIinWcl9CqWcCz6+i7ZHYeqoCmWlpa
         5c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=WjQyJp2iY5fGQc+V5V9CzoNmpSilM+nwtjmuAYauCEg=;
        b=ULF3uhe/ktqmOimHQ0ULXVe82oUGKahNIHzoEIGy8PQbH7CWas0tAxPmKKbByGmtSt
         91rn1+1Tc89GrtxXGDlj1PYPS8CclADgmpoqBNRMlkOYcOZKKYi/uGP9Vu0KKx1pWWUg
         TvL64jGNADVLIMtG783LrX02FHKBvjPBbIi0ptolHymgFbONF+j0WG9h7sr8JE79BjUE
         N0M7DCikiBXpO185y0kg2bjPYevbhaPQcRrJcPGiaD8MZ0tjKJqdspLNTgj//4x/qpMu
         YKjjOR9Ir628Ov4Zz0v3Q8CI4TSrdLaeebwVBf6+5UOOxgJxTYWtXfrlMesdWizv3Okf
         NAWA==
X-Gm-Message-State: APjAAAXF5cqjpSSvw+NMlwD7qjVEMENh3N11bjalwEAbVo5GZ8hpQY93
        R/aua2Nzzyjf+cdjW4MmyUwfrA==
X-Google-Smtp-Source: APXvYqwfPQEhJ9ZqyNl1gitN8PCg095jCz3ViGeh+JQ6PhSKFerq2czllQDDaVCc7B0WKAcPGCi1og==
X-Received: by 2002:ac2:51a3:: with SMTP id f3mr13273142lfk.125.1562078670487;
        Tue, 02 Jul 2019 07:44:30 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id 11sm3821577ljc.66.2019.07.02.07.44.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 07:44:30 -0700 (PDT)
Date:   Tue, 2 Jul 2019 17:44:27 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     netdev@vger.kernel.org,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        grygorii.strashko@ti.com, jakub.kicinski@netronome.com,
        daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] net: core: page_pool: add user refcnt and reintroduce
 page_pool_destroy
Message-ID: <20190702144426.GD4510@khorivan>
Mail-Followup-To: Jesper Dangaard Brouer <brouer@redhat.com>,
        netdev@vger.kernel.org,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        grygorii.strashko@ti.com, jakub.kicinski@netronome.com,
        daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20190702153902.0e42b0b2@carbon>
 <156207778364.29180.5111562317930943530.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <156207778364.29180.5111562317930943530.stgit@firesoul>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 02, 2019 at 04:31:39PM +0200, Jesper Dangaard Brouer wrote:
>From: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>
>Jesper recently removed page_pool_destroy() (from driver invocation) and
>moved shutdown and free of page_pool into xdp_rxq_info_unreg(), in-order to
>handle in-flight packets/pages. This created an asymmetry in drivers
>create/destroy pairs.
>
>This patch add page_pool user refcnt and reintroduce page_pool_destroy.
>This serves two purposes, (1) simplify drivers error handling as driver now
>drivers always calls page_pool_destroy() and don't need to track if
>xdp_rxq_info_reg_mem_model() was unsuccessful. (2) allow special cases
>where a single RX-queue (with a single page_pool) provides packets for two
>net_device'es, and thus needs to register the same page_pool twice with two
>xdp_rxq_info structures.

As I tend to use xdp level patch there is no more reason to mention (2) case
here. XDP patch serves it better and can prevent not only obj deletion but also
pool flush, so, this one patch I could better leave only for (1) case.

-- 
Regards,
Ivan Khoronzhuk
