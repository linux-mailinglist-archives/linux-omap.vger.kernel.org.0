Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485C82CEB33
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 10:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729768AbgLDJlP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 04:41:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58578 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727430AbgLDJlO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 04:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607074788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0jjINtwvJCiGdXQ3CnWEPhNnh3LSONttoILNEJIyo78=;
        b=Bg1Db1QY4BCnBq4zERUe0lkadELWJ1eI5neYjpvGZI62o6lYBlSHjZETfC3Q/iDA4zVSx+
        ROVPfMFS3wsC8SX8X+4jx7/UUw0g8XHwVdLWqNEZnZg95YPX06Fi9E+pJdwEYvuO4HdviI
        nZgcn8vws0dC3jlz44BAjX1p1Mos8UQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-xiToj_eOPBWJIjIzMfLcqQ-1; Fri, 04 Dec 2020 04:39:44 -0500
X-MC-Unique: xiToj_eOPBWJIjIzMfLcqQ-1
Received: by mail-ej1-f69.google.com with SMTP id z10so1864429eje.5
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 01:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=0jjINtwvJCiGdXQ3CnWEPhNnh3LSONttoILNEJIyo78=;
        b=fUHmgYVGRNhG/RjYaU6T/oOAgZmmzyx1HP8e/abZ9tUy4rU+hPa2uKd75D4C8aMCMA
         9iLAwmQLoa0opYYuwi0G2HusT0IwzwJ4yQoSDN7ZElhva26QC4QjvatsWH58dHtqWbLu
         mkzzExhfAXHNsg0iVzftEoEaKbFPPnpIXki9zMoyyNRlp+m+2JQIdrk3LTt24qbLnjKQ
         +i6l+bJp27LRNlHopk/gHrpqFZPhrhwK/uxibW4zdGUY5Ep0k5bIiN4Gt8a9KQo8+uD/
         Ml0Q+d8h/MW0pLyMWqWx/yUmlVuThj/2q7ztl1Mx7EGva+TPel0xNvPo/T9T70Ak+Onv
         5uxg==
X-Gm-Message-State: AOAM533821wGDZXTe+p7ItiqcNP7ZZ+8fk+CfM/om9R4PY+vAxbK9Kfl
        2/VjtjcJYDVRPHkjYmN6r8PhL4tL9kLWdb+vonrPh7rd3W/Mlf4Q1kRcE+60VKKDI5s3WxCCgkA
        Gy+feZZBup+gXnpyDVIN9ZA==
X-Received: by 2002:a50:bec4:: with SMTP id e4mr6735670edk.65.1607074783651;
        Fri, 04 Dec 2020 01:39:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5IofxI5GxincoDqkd8oJ6iR7fUjDjNYLGczOvN1YbjkTCAYvTsz2dQOkDmTW8+SVmWvjfew==
X-Received: by 2002:a50:bec4:: with SMTP id e4mr6735661edk.65.1607074783460;
        Fri, 04 Dec 2020 01:39:43 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id q26sm2752395ejt.73.2020.12.04.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 01:39:42 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 95150182EEA; Fri,  4 Dec 2020 10:39:42 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andriin@fb.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Simon Horman <simon.horman@netronome.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jiri Benc <jbenc@redhat.com>, oss-drivers@netronome.com,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH bpf 3/7] netdevsim: Add debugfs toggle to reject BPF
 programs in verifier
In-Reply-To: <20201203174417.46255de5@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
References: <160703131710.162669.9632344967082582016.stgit@toke.dk>
 <160703132036.162669.7719186299991611592.stgit@toke.dk>
 <20201203174417.46255de5@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 04 Dec 2020 10:39:42 +0100
Message-ID: <87lfed9ag1.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Thu, 03 Dec 2020 22:35:20 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/n=
etdevsim.h
>> index 827fc80f50a0..d1d329af3e61 100644
>> --- a/drivers/net/netdevsim/netdevsim.h
>> +++ b/drivers/net/netdevsim/netdevsim.h
>> @@ -190,6 +190,7 @@ struct nsim_dev {
>>  	struct bpf_offload_dev *bpf_dev;
>>  	bool bpf_bind_accept;
>>  	u32 bpf_bind_verifier_delay;
>> +	bool bpf_bind_verifier_accept;
>>  	struct dentry *ddir_bpf_bound_progs;
>
> nit: if you respin please reorder the bpf_bind_verifier_* fields so
> that the structure packs better.

Ah, good point, will do!

> Acked-by: Jakub Kicinski <kuba@kernel.org>
>
> Thanks for fixing this test!

You're welcome :)

I'll see if I can't get our CI people to also run it regularly so we can
avoid it regressing again...

-Toke

