Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715534E607E
	for <lists+linux-omap@lfdr.de>; Thu, 24 Mar 2022 09:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbiCXIlU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Mar 2022 04:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbiCXIlT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Mar 2022 04:41:19 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4F1986FB
        for <linux-omap@vger.kernel.org>; Thu, 24 Mar 2022 01:39:48 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id w7so771993pfu.11
        for <linux-omap@vger.kernel.org>; Thu, 24 Mar 2022 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=knqu4EHlPEe2vapCUtLiLS6umBwWitS7go5iV4TMqUNg5fMa09KV180eKl/2fY0D8I
         XWmGTsxjrAj/JoySZzB9lsK6zV9kDqqIFNIZV5RcGkhN+VMZDliAzaL6InMMfujiDB+L
         4ygNXxiF6N0/N9av/pDFNTqxTJIHvj8R5YtjIKj4i90myCV4hxHijC96QVMZ1e33cvF0
         va8o3O63KECF1QJf71Kefk9I2Q3rEovjuUqvE06vzPnP1EJIqnA/QmTiH8iZsqDOEYQw
         8nyStChyRpGK2AlOuNMwUWKE0X0jl6iKinjosMIwsx5oQFcFBgsNmx0tzTDASSyhDjLV
         SQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=YHcF7wMJQWnV85cPUtvNZ3jwcPhTCOEPh9YNr501LaZpKiLQsJanpV2a7q75Opt0D2
         PU//pkBlFw3epJRZYfLcfpJeqm7HieIpKXnEGaNVEYqQYDLBKm2IxdKyeeqZ+0uuQkS+
         IQdW3TV828wcDXpXujzqOr8WzH4dIZhn0e2jmTM/dVcSeTW8Xh5L1iV0Uwm/mC3jP+Xd
         qU75UgEA+YkLR3GzYxeqj5rIpj7mUrHXp05qyekAm+Grqih4ayzgra/OqyixKkxcwRgh
         MnYx82c2AT/fJ1ki1bKACm753a/Rnk0zWfhyGcZDkKcSzQPIi6fFjFMhjVjPNR4LMS+r
         vS9Q==
X-Gm-Message-State: AOAM531dK5Swz4MwspEKoNr/yPO4GvjoeigGCktEe56GnT4PlEng5o2V
        PYsibQHowtUMFN+73f6i6xxEQHMvIkn4PrpWV0g=
X-Google-Smtp-Source: ABdhPJxmyWd0KqPs0yqndd7KL89TsI7N1zIoLxW55ytTzLTJMxCQ+vh3Ss1TygXlo91i2NMCOYLaUhV47fj/eXuC3J8=
X-Received: by 2002:a63:f40e:0:b0:380:6a04:4335 with SMTP id
 g14-20020a63f40e000000b003806a044335mr3162681pgi.523.1648111187976; Thu, 24
 Mar 2022 01:39:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:1e0e:b0:59:8772:6103 with HTTP; Thu, 24 Mar 2022
 01:39:47 -0700 (PDT)
Reply-To: ozkansahin.gbbva@gmail.com
From:   OZKAN SAHIN <bryanwalker534@gmail.com>
Date:   Thu, 24 Mar 2022 11:39:47 +0300
Message-ID: <CAKxfBbT4N5GKmc+ZkOfdpyVm-NNBk1QHCmOOi7LaT7pK6YsJVg@mail.gmail.com>
Subject: Hi Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:429 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4951]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [bryanwalker534[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [bryanwalker534[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Greetings,
I'm  Ozkan Sahin, and I work as a Financial Management Consultant. I'm
thrilled to approach you and present you with a lucrative offer I've
prepared. If you're interested in learning more, Please reply as soon
as possible.

Please contact me at (ozkansahin.gbbva@gmail.com).
Respectfully,
Ozkan Sahin
Financial Management Consultant
