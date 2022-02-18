Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8E94BB740
	for <lists+linux-omap@lfdr.de>; Fri, 18 Feb 2022 11:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbiBRKue (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Feb 2022 05:50:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbiBRKud (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Feb 2022 05:50:33 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067F62B3ADF
        for <linux-omap@vger.kernel.org>; Fri, 18 Feb 2022 02:50:17 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id v12so13879366wrv.2
        for <linux-omap@vger.kernel.org>; Fri, 18 Feb 2022 02:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mxloxoJOUQuOqyh3mpBmSqWnS2CPbZolNXu8YOxGWnQ=;
        b=Lj4t7yMep7cgBayNkBBP61sgeFm0BApmH0EW/GWq9dzqDh/FRRDuKVFlwMSSzz+XKL
         Sme/kNSBAQJj3Yqz5ZS7sA7nTN8w/vrVQowPKlb8MUqVyVheDqUKDKJOK9UVXxKZgqwR
         buMny4Leh8GqTVux1KSX3dWfmBcwMdvpiEDUrJAt0c51ij/RfBvWqKBtCskYqfP8Wbf7
         0FWLA3c7Y8m4ZbKXguG0ZROyDAaA+7HwniwzasVuHCjWsYmHEahvqwM/m/3Pa9kY7DjX
         m6LfZzS76bC5+eTbsASl8Dz6XtLdmbdZ5oAa66LwGb5Osy40m5YCUo+qdZVKWCKKlCfv
         y5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mxloxoJOUQuOqyh3mpBmSqWnS2CPbZolNXu8YOxGWnQ=;
        b=yv2XbotDhzcicZW4nuPwtIJrVIpqLbk52fRGzMX20Zm7jNus68Bc1uorah61LHajzP
         rWPfjWsovdkF5Lw+FkZqfTJ/FA3wGBIn++bU54wnIyFAegYguzTQUIg/me4l57hqL8Pi
         VDjmYki+Z85wxQ9zbBWsMK9fd2Crkj4OaDKau95O5zWLojikIGr3XADvctYsA6aHHQbA
         /Qq8ZG4EM8Ty28TMg5B5oZfs2Xn39rZHHITojN07uzH5aTeDWrN8oupJ1GlAuuRVINLO
         PyEBlyAx7Xtcd6Ik7G5lBbAb4owBmNaizBk2els2tPIqOH/7iNgZvTneQ4cPTWmapUFE
         V0ww==
X-Gm-Message-State: AOAM532K8qA+XEHqSQC2pUxW4oeI6NJMNsXP+E0LnF5imkeIjtNfI10O
        nFU+D9JxFwiZKjyndY5QBvGkfcvbSCndzA==
X-Google-Smtp-Source: ABdhPJzJ6tTNU8o+vnBYOVB1KN6T/24Osw1bGZwZxHA+H0lD0G14AOnr5c3CBBfVyH5RWb8pqwdbHw==
X-Received: by 2002:adf:f1d2:0:b0:1e4:aef2:76a8 with SMTP id z18-20020adff1d2000000b001e4aef276a8mr5415531wro.445.1645181415577;
        Fri, 18 Feb 2022 02:50:15 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id 1sm18254746wrz.75.2022.02.18.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 02:50:15 -0800 (PST)
Message-ID: <270a2fac-19e7-fd15-4fb8-d2404fcabe86@smile.fr>
Date:   Fri, 18 Feb 2022 11:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drivers/thermal/ti-soc-thermal: Add hwmon support
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <20220216172206.7448-1-romain.naour@smile.fr>
 <Yg9YtqxqzvUHbKfN@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <Yg9YtqxqzvUHbKfN@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Le 18/02/2022 à 09:28, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [220216 17:21]:
>> Expose ti-soc-thermal thermal sensors as HWMON devices.
> 
> Can you please send this to the ti-soc-thermal maintainer(s)
> and related subsystem mailing list with linux-omap in Cc?
> See the MAINTAINERS file for info and scripts/get-maintainer.pl
> script.

Ok, I was not sure if adding two mailing list was mandatory.

> 
> Then the subsystem maintainer(s) will pick it up, or will
> ack it and I can pick it up.

Thanks, sorry for the noise.

Best regards,
Romain


> 
> Regards,
> 
> Tony

