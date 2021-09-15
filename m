Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2527F40C25F
	for <lists+linux-omap@lfdr.de>; Wed, 15 Sep 2021 11:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237037AbhIOJHB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Sep 2021 05:07:01 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48630
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233048AbhIOJHA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Sep 2021 05:07:00 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4E49040281
        for <linux-omap@vger.kernel.org>; Wed, 15 Sep 2021 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631696741;
        bh=X7Cc3jU81HRUvI9Nu63KcpmXz37KgSemXGthehwJJeg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NnbjDhYGIe4FnnMt07KjCNzXBOb4mfZ2Osi9GakQeV9c+gV3x/AqVijGK9f10ZB7f
         4etHNu7CUrXYOQzyUuRCKRvN6FiQVrqTHBXzXKAj6+1wHe3jfwubOemLj87xxyfan4
         6CVcXCf4cTjRBBnyJZf7JftijNNSmcMEt1BJneUWbsmdgLvtmm4WJQ0HCjwO8bQ1Q3
         WImikxSu2JLVAOOofoVHt2e2Lt0XunwLRf+HVaL0S0dq6XbEtiA1QIlH33OLmgjOH5
         PQUD289eul0fk2mNqPDZikB/E5qtuJDGRtCsZZFxrz6kt7w3WBB9DpTso0a4LsZq9R
         4cgaoK8Cdaycg==
Received: by mail-ed1-f70.google.com with SMTP id z17-20020a05640240d100b003cac681f4f4so1199717edb.21
        for <linux-omap@vger.kernel.org>; Wed, 15 Sep 2021 02:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X7Cc3jU81HRUvI9Nu63KcpmXz37KgSemXGthehwJJeg=;
        b=z2Qu+iXsyAGW7kPDZHDDSccIyVrgfQf76UtK6nYjSfecctUZ4FZs+V33EM+aCD87dh
         Vr9RAlgPiZCQeQ2N7Zv9r5eBrLBHagTkTKRs3XRMJ90bmIa3EuEZP5P/DEVBA1CTYuSc
         shOLMiv+3UB5brQCDzrVTgAj4EQiZOkhJ9HpQPvaB5jjkRtMtRkAfh3B1DH1Bwf1lS4t
         2ti0NIax7oqLYnM8Kb1UCaMa9JyeXM8Wb6H0l3jlw7AXRgVVbmLXpUf/5ccHFoLaUyf/
         1cKazcdRg6MKq7S7mFOYH4+fvZFFAtqbVzobfJZkrG7CIUhPSUPUBUq6EGjr1weDKQhj
         Hwww==
X-Gm-Message-State: AOAM531fufjsRyi7sUSEnwS4nn2BYBvC/0qbMWQ0owO6fRKxIg6syC6v
        YPmZdgDWkaiJVZTTgsaW5ToR33PIwR1+RIvpsgETJe44gPEokEYwGCQO4f7wR29LR00BECUY1Fe
        s4ohvBYyWygcwtV63MlyDUJH/oW8V6ZCE/3bBAoM=
X-Received: by 2002:a17:907:7613:: with SMTP id jx19mr24334738ejc.453.1631696739813;
        Wed, 15 Sep 2021 02:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD9fO3zbzPRg3ejtmsih8V9NIThIYB0jKBalTlLEm2XpSRUk4IVkXNzIOR7td1TQ+/UiTNCQ==
X-Received: by 2002:a17:907:7613:: with SMTP id jx19mr24334728ejc.453.1631696739675;
        Wed, 15 Sep 2021 02:05:39 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id c5sm6843180edx.81.2021.09.15.02.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 02:05:39 -0700 (PDT)
Subject: Re: [PATCH v4 8/8] memory: gpmc-omap: "gpmc,device-width" DT property
 is optional
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-9-rogerq@kernel.org>
 <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
 <6a06f4bd-f20a-8b5a-c152-0877707670ff@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1b915c39-fd6d-3c3c-e4bf-4df9a694dfb6@canonical.com>
Date:   Wed, 15 Sep 2021 11:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6a06f4bd-f20a-8b5a-c152-0877707670ff@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/09/2021 10:47, Roger Quadros wrote:
> Hi Krzysztof,
> 
> On 15/09/2021 10:12, Krzysztof Kozlowski wrote:
>> On 14/09/2021 14:27, Roger Quadros wrote:
>>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>>> at one place. Default to 8-bit width if none present.
>>>
>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>> ---
>>>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>>>  1 file changed, 26 insertions(+), 15 deletions(-)
>>>
>>
>> All the comments from v3 are still applicable because it seems you
>> ignored them. Please respond to them.
>>
>> It's the second patch where the reviewer's comments got lost, so it
>> creates rather poor impression.
> 
> I was wondering what comments and then realized that gmail server has put
> all your messages into spam folder.
> 
> I'm very sorry about that. I will address your comments ASAP.

Oops. There were just two emails from me for v3. Can you send me
(privately) the headers from my emails so I can investigate why they
ended up on Spam?

Best regards,
Krzysztof
